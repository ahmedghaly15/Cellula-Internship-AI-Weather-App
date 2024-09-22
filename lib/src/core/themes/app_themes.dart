import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get lightMode => ThemeData(
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.scaffoldBackgroundColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );
}
