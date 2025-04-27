part of 'system_statues_cubit.dart';

sealed class SystemStatuesState extends Equatable {
  const SystemStatuesState();

  @override
  List<Object> get props => [];
}

final class SystemStatuesInitial extends SystemStatuesState {}

final class SystemStatuesLoading extends SystemStatuesState {}

final class SystemStatuesOff extends SystemStatuesState {}

final class SystemStatuesSuccess extends SystemStatuesState {
  final SystemStatues statues;
  @override
  List<Object> get props => [statues]; // This ensures proper equality checks
  const SystemStatuesSuccess({required this.statues});
}

final class SystemStatuesRefresh extends SystemStatuesState {
  final SystemStatues statues;

  const SystemStatuesRefresh({required this.statues});
}

final class SystemStatuesFail extends SystemStatuesState {
  final String err;

  const SystemStatuesFail({required this.err});
}
