import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class CityAndCountryAndRefreshButton extends StatelessWidget {
  const CityAndCountryAndRefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 32.h,
            ),
            label: Text(
              'Forecast',
              style: AppTextStyles.font16WhiteBold,
            ),
          ),
        ],
      ),
    );
  }
}
