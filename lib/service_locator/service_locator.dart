import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_class/api/dio_consumer.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<MainRepoImpl>(
    MainRepoImpl(api: getIt<DioConsumer>()),
  );
}
