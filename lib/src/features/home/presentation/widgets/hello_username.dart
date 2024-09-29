import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/check_if_user_is_logged_in.dart';

class HelloUsername extends StatelessWidget {
  const HelloUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, left: 24.w),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hello, ',
              style: AppTextStyles.font24WhiteBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            TextSpan(
              text: currentUser?.name ?? 'AAAAAAA',
              style: AppTextStyles.font24WhiteBold,
            ),
          ],
        ),
      ),
    );
  }
}
