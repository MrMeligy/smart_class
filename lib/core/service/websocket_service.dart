import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  final StreamController<Map<String, dynamic>> _dataController =
      StreamController<Map<String, dynamic>>.broadcast();

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  // Stream الذي سيستمع إليه أي Cubit
  Stream<Map<String, dynamic>> get dataStream => _dataController.stream;

  // إنشاء اتصال بـ WebSocket
  Future<bool> connect(String url) async {
    if (_isConnected) {
      return true;
    }

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _subscription = _channel!.stream.listen(
        (dynamic message) {
          try {
            final data = json.decode(message as String) as Map<String, dynamic>;
            _dataController.add(data);
          } catch (e) {
            _dataController.addError('Failed to parse data: $e');
          }
        },
        onError: (error) {
          _dataController.addError('WebSocket error: $error');
          _isConnected = false;
        },
        onDone: () {
          _isConnected = false;
        },
      );

      _isConnected = true;
      return true;
    } catch (e) {
      _isConnected = false;
      _dataController.addError('Connection failed: $e');
      return false;
    }
  }

  // إغلاق اتصال الـ WebSocket
  Future<void> disconnect() async {
    await _subscription?.cancel();
    _subscription = null;

    if (_channel != null) {
      await _channel!.sink.close(status.goingAway);
    }

    _isConnected = false;
  }

  // إرسال بيانات عبر الـ WebSocket
  Future<bool> send(dynamic data) async {
    if (!_isConnected || _channel == null) {
      return false;
    }

    try {
      _channel!.sink.add(data is String ? data : json.encode(data));
      return true;
    } catch (e) {
      return false;
    }
  }

  // التخلص من الموارد عند الانتهاء
  Future<void> dispose() async {
    await disconnect();
    await _dataController.close();
  }
}
