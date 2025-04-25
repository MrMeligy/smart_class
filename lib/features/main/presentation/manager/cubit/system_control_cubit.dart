import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo.dart';

part 'system_control_state.dart';

class SystemControlCubit extends Cubit<SystemControlState> {
  SystemControlCubit(this.mainRepo) : super(SystemControlInitial());
  final MainRepo mainRepo;
  systemControl({required String mode}) async {
    await mainRepo.systemControl(mode: mode);
    if (mode == "on") {
      emit(SystemControlOn());
    } else {
      emit(SystemControlOff());
    }
  }
}
