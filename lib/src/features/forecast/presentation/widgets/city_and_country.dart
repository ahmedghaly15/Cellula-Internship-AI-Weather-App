import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class CityAndCountry extends StatelessWidget {
  const CityAndCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cairo',
          style: AppTextStyles.font24WhiteBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          'Egypt',
          style: AppTextStyles.font16WhiteBold,
        ),
      ],
    );
  }
}
