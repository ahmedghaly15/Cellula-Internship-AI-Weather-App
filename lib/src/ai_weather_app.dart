import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/router/app_router.dart';

import 'package:internship_ai_weather_app/src/core/themes/app_themes.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_strings.dart';

class AIWeatherApp extends StatelessWidget {
  const AIWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: AppThemes.lightMode,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
