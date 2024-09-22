import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class AuthViewDescription extends StatelessWidget {
  const AuthViewDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.font16WhiteRegular,
    );
  }
}

