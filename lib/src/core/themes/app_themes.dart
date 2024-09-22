import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_strings.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get lightMode => ThemeData(
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        fontFamily: AppStrings.fontFamily,
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
