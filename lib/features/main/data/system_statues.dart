import 'package:equatable/equatable.dart';

class SystemStatues extends Equatable {
  final bool? systemEnabled;
  final double? temperature;
  final double? humidity;
  final int? smokeValue;
  final int? lightValue;
  final int? peopleCount;
  final bool? windowOpen;
  final bool? projectorOpen;
  final bool? fanOn;
  final bool? relayOn;
  final bool? windowManual;

  const SystemStatues({
    this.systemEnabled,
    this.temperature,
    this.humidity,
    this.smokeValue,
    this.lightValue,
    this.peopleCount,
    this.windowOpen,
    this.projectorOpen,
    this.fanOn,
    this.relayOn,
    this.windowManual,
  });

  factory SystemStatues.fromJson(Map<String, dynamic> json) => SystemStatues(
        systemEnabled: json['system_enabled'] as bool?,
        temperature: (json['temperature'] as num?)?.toDouble(),
        humidity: (json['humidity'] as num?)?.toDouble(),
        smokeValue: json['smoke_value'] as int?,
        lightValue: json['light_value'] as int?,
        peopleCount: json['people_count'] as int?,
        windowOpen: json['window_open'] as bool?,
        projectorOpen: json['projector_open'] as bool?,
        fanOn: json['fan_on'] as bool?,
        relayOn: json['relay_on'] as bool?,
        windowManual: json['window_manual'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'system_enabled': systemEnabled,
        'temperature': temperature,
        'humidity': humidity,
        'smoke_value': smokeValue,
        'light_value': lightValue,
        'people_count': peopleCount,
        'window_open': windowOpen,
        'projector_open': projectorOpen,
        'fan_on': fanOn,
        'relay_on': relayOn,
        'window_manual': windowManual,
      };

  @override
  List<Object?> get props {
    return [
      systemEnabled,
      temperature,
      humidity,
      smokeValue,
      lightValue,
      peopleCount,
      windowOpen,
      projectorOpen,
      fanOn,
      relayOn,
      windowManual,
    ];
  }
}
