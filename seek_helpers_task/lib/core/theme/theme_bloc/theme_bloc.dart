import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme {
  light,
  dark,
  system
}

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(_getDefaultTheme()) {
    // Listen to system theme changes
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      if (state == AppTheme.system) {
        emit(AppTheme.system);
      }
    };
  }

  static AppTheme _getDefaultTheme() {
    // Get system brightness
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark ? AppTheme.dark : AppTheme.light;
  }

  void toggleTheme() {
    emit(state == AppTheme.light ? AppTheme.dark : AppTheme.light);
  }

  void setSystemTheme() {
    emit(AppTheme.system);
  }
}