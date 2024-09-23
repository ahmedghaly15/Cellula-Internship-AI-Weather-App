import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.color = AppColors.primaryColor,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
