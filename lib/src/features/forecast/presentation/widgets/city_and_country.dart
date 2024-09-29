import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class CityAndCountry extends StatelessWidget {
  const CityAndCountry({
    super.key,
    required this.city,
    required this.country,
  });

  final String city, country;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: AppTextStyles.font24WhiteBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          country,
          style: AppTextStyles.font16WhiteBold,
        ),
      ],
    );
  }
}
