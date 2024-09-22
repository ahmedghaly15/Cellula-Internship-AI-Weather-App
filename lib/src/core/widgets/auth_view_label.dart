import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class AuthViewLabel extends StatelessWidget {
  const AuthViewLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.font48WhiteBold,
    );
  }
}
