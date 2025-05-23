import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/core/cache/cache_helper.dart';
import 'package:smart_class/features/main/presentation/manager/cubit/system_control_cubit.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo_impl.dart';
import 'package:smart_class/features/main/presentation/manager/statues_cubit/system_statues_cubit.dart';
import 'package:smart_class/features/main/presentation/screens/main_screen.dart';
import 'package:smart_class/core/service_locator/service_locator.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    setupServiceLocator();
    await ScreenUtil.ensureScreenSize();
    runApp(const MyApp());
  } catch (e) {
    // يمكنك إظهار واجهة خطأ بسيطة هنا بدلاً من شاشة بيضاء
    runApp(
        MaterialApp(home: Scaffold(body: Center(child: Text('حدث خطأ: $e')))));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SystemStatuesCubit(getIt<MainRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SystemControlCubit(getIt<MainRepoImpl>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MainScreen(),
        ),
      ),
    );
  }
}
