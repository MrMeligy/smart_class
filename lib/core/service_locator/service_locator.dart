import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_class/core/api/dio_consumer.dart';
import 'package:smart_class/core/cache/cache_helper.dart';
import 'package:smart_class/core/service/websocket_service.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<WebSocketService>(() => WebSocketService());
  getIt.registerSingleton<MainRepoImpl>(
    MainRepoImpl(
        webSocketService: getIt<WebSocketService>(), api: getIt<DioConsumer>()),
  );
}
