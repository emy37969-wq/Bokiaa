import 'package:bokiaa/core/theme/app-colors.dart';
import 'package:bokiaa/core/theme/data/app_color-scheme.dart';
import 'package:flutter/material.dart';


class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    extensions: const [AppColorScheme.light],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground, // 0xFF1C1410
    extensions: const [AppColorScheme.dark],
  );
}

extension AppColorSchemeX on BuildContext {
  AppColorScheme get appColors => Theme.of(this).extension<AppColorScheme>()!;
}