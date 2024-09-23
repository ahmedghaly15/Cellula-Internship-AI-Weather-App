import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HOME SCREEN',
          style: AppTextStyles.font48WhiteBold,
        ),
      ),
    );
  }
}
