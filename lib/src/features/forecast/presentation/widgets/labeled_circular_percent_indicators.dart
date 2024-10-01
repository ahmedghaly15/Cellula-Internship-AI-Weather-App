import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/labeled_circular_percent_attributes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LabeledCircularPercentIndicators extends StatelessWidget {
  const LabeledCircularPercentIndicators({
    super.key,
    required this.attributes,
  });

  final List<LabeledCircularPercentAttributes> attributes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 16.h,
        children: List.generate(
          attributes.length,
          (index) => _labelCircularPercentIndicator(
            label: attributes[index].label,
            percent: attributes[index].percent,
          ),
        ),
      ),
    );
  }

  Widget _labelCircularPercentIndicator({
    required String label,
    required double percent,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Text(
              label,
              style: AppTextStyles.font16WhiteRegular,
            ),
          ),
          CircularPercentIndicator(
            radius: 56.r,
            lineWidth: 10.r,
            animation: true,
            percent: percent,
            progressColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '${(percent * 100).toStringAsFixed(1)}%',
              style: AppTextStyles.font24WhiteBold,
            ),
          ),
        ],
      );
}
