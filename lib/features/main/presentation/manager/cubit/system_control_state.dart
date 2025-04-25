part of 'system_control_cubit.dart';

sealed class SystemControlState extends Equatable {
  const SystemControlState();

  @override
  List<Object> get props => [];
}

final class SystemControlInitial extends SystemControlState {}

final class SystemControlOn extends SystemControlState {}

final class SystemControlOff extends SystemControlState {}
