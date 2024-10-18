import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class WeatherPredictionDialog extends StatelessWidget {
  const WeatherPredictionDialog({super.key, required this.prediction});

  final List<int> prediction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: AppColors.primaryColor,
      icon: Icon(
        _isWeatherPredictedToBeGood ? Icons.check_circle : Icons.cancel,
        color: _isWeatherPredictedToBeGood ? Colors.green : Colors.red,
        size: 48.h,
      ),
      title: Text(
        'Tennis Play Prediction',
        style: AppTextStyles.font24WhiteBold,
      ),
      content: Text(
        _isWeatherPredictedToBeGood
            ? 'Yes, you can play.'
            : 'Unfortunately, you can not play.',
        style: AppTextStyles.font16WhiteRegular,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Ok',
            style: AppTextStyles.font16WhiteBold,
          ),
        ),
      ],
    );
  }

  bool get _isWeatherPredictedToBeGood => prediction[0] == 1;
}
