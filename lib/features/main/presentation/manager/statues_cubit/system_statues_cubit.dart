import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_class/features/main/data/system_statues.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo.dart';

part 'system_statues_state.dart';

class SystemStatuesCubit extends Cubit<SystemStatuesState> {
  SystemStatuesCubit(this.mainRepo) : super(SystemStatuesInitial());
  final MainRepo mainRepo;
  getStatues() async {
    emit(SystemStatuesLoading());
    final response = await mainRepo.getStatues();
    response.fold(
      (err) => emit(SystemStatuesFail(err: err)),
      (statues) => emit(
        SystemStatuesSuccess(statues: statues),
      ),
    );
  }

  offStatus() async {
    emit(
      SystemStatuesOff(),
    );
  }
}
