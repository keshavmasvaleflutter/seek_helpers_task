import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return ColorScheme(
      primary: Color(0xFF1E293B), // (text-primary)
      onPrimary: Color(0xFFF8FAFC), // (bg-primary)
      secondary: Color(0xFF64748B),  // (text-secondary)
      surface: Color(0xFFFFFFFF), //  (bg-secondary, bg-card)
      error: Colors.red,
      onSecondary: Color(0xFF6366F1), //  (accent-primary)
      primaryFixed: Color(0xFF8B5CF6), // (accent-secondary)
      primaryFixedDim: Color(0xFFF1F5F9),
      outlineVariant: Color(0xFFE2E8F0), // (border-color)
      onSurface: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return ColorScheme(
      primary: Color(0xFFF1F5F9), // (text-primary)
      onPrimary: Color(0xFF0F172A), // (bg-primary)
      secondary: Color(0xFF94A3B8),  // (text-secondary)
      surface: Color(0xFF334155), //  (bg-secondary, bg-card)
      error: Colors.red,
      onSecondary: Color(0xFF818CF8), //  (accent-primary)
      primaryFixed: Color(0xFF8B5CF6), // (accent-secondary)
      primaryFixedDim: Color(0xFFF1F5F9),
      outlineVariant: Color(0xFF475569), // (border-color)
      onSurface: Colors.white,
      onError: Colors.white,
      brightness: Brightness.dark,
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.primary,
      displayColor: colorScheme.primary,
    ),
    scaffoldBackgroundColor: colorScheme.onPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.onPrimary,
      foregroundColor: colorScheme.primary,
    )
  );
}
