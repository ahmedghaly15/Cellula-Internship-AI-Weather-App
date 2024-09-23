import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_circular_progress_indicator.dart';

Widget circularIndicatorOrTextWidget({
  required bool isLoading,
  required String text,
}) {
  return isLoading
      ? SizedBox.square(
          dimension: 24.h,
          child: const CustomCircularProgressIndicator(
            color: Colors.white,
          ),
        )
      : Text(
          text,
          style: AppTextStyles.font28Bold,
        );
}
