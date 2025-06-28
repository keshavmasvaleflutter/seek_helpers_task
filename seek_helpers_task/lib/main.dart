import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seek_helpers_task/features/features.dart';

import 'app_router.dart';
import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CusotmBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
            BlocProvider(
              create: (context) => UserBloc(
                userRepository: UserRepository(),
              ),
            ),
          ],
          child: BlocBuilder<ThemeCubit, AppTheme>(
            builder: (context, themeState) {
              final materialTheme = MaterialTheme(textTheme);
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.appRouter,
                theme: materialTheme.light(), //  light theme
                darkTheme: materialTheme.dark(), // dark theme
                themeMode: themeState == AppTheme.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
            },
          ),
        );
      },
    );
  }
}