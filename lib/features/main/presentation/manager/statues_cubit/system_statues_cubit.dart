import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_class/core/api/end_ponits.dart';
import 'package:smart_class/core/service_locator/service_locator.dart';
import 'package:smart_class/features/main/data/system_statues.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo.dart';
import 'package:smart_class/core/service/websocket_service.dart';

part 'system_statues_state.dart';

class SystemStatuesCubit extends Cubit<SystemStatuesState> {
  SystemStatuesCubit(this.mainRepo) : super(SystemStatuesInitial());

  final MainRepo mainRepo;
  final WebSocketService _webSocketService = getIt<WebSocketService>();
  StreamSubscription<Map<String, dynamic>>? _webSocketSubscription;

  getStatues() async {
    emit(SystemStatuesLoading());

    try {
      // Close any existing connection before creating a new one
      await _webSocketSubscription?.cancel();
      await _webSocketService.disconnect();

      final connected = await _webSocketService
          .connect('ws://${EndPoint.updatedUrl()}/ws/status');

      if (connected) {
        // Add some debug print statements
        print('WebSocket connected successfully');

        _webSocketSubscription = _webSocketService.dataStream.listen(
          (data) {
            print('WebSocket data received: $data');
            final statues = SystemStatues.fromJson(data);
            emit(SystemStatuesSuccess(statues: statues));
            // emit(SystemStatuesRefresh(statues: statues));
          },
          onError: (error) {
            print('WebSocket error: $error');
            emit(SystemStatuesFail(err: error.toString()));
          },
          onDone: () {
            print('WebSocket connection closed');
            // Try to reconnect when connection is closed
            Future.delayed(Duration(seconds: 3), () {
              if (state is! SystemStatuesOff) {
                getStatues();
              }
            });
          },
        );
      } else {
        emit(SystemStatuesFail(err: 'Failed to connect to WebSocket'));
      }
    } catch (e) {
      print('Error in getStatues: $e');
      emit(SystemStatuesFail(err: e.toString()));
    }
  }

  Future<void> offStatus() async {
    try {
      // First check if subscription exists before cancelling
      if (_webSocketSubscription != null) {
        await _webSocketSubscription?.cancel();
        _webSocketSubscription = null;
      }

      // Then safely disconnect the WebSocket service
      if (_webSocketService.isConnected) {
        await _webSocketService.disconnect();
      }

      // Finally emit the off state
      emit(SystemStatuesOff());
    } catch (e) {
      print('Error in offStatus: $e');
      // Still try to emit the off state even if there was an error
      emit(SystemStatuesOff());
    }
  }

  @override
  Future<void> close() async {
    try {
      await _webSocketSubscription?.cancel();
      await _webSocketService.disconnect();
    } catch (e) {
      print('Error in close: $e');
    }
    return super.close();
  }
}
