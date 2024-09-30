import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class ConditionText extends StatelessWidget {
  const ConditionText({
    super.key,
    required this.condition,
  });

  final String condition;

  @override
  Widget build(BuildContext context) {
    return Text(
      condition,
      style: AppTextStyles.font24WhiteBold,
      textAlign: TextAlign.center,
    );
  }
}
