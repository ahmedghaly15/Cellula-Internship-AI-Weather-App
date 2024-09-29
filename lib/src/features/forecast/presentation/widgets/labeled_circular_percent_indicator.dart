import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LabeledCircularPercentIndicator extends StatelessWidget {
  const LabeledCircularPercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Humidity',
          style: AppTextStyles.font16WhiteRegular,
        ),
        MySizedBox.height4,
        CircularPercentIndicator(
          radius: 42.r,
          lineWidth: 10.r,
          percent: 0.5,
          progressColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            '50%',
            style: AppTextStyles.font24WhiteBold,
          ),
        ),
      ],
    );
  }
}
