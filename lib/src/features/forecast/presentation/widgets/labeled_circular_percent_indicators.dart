import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/labeled_circular_percent_indicator.dart';

class LabeledCircularPercentIndicators extends StatelessWidget {
  const LabeledCircularPercentIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCircularPercentIndicator(),
              LabeledCircularPercentIndicator(),
            ],
          ),
          MySizedBox.height24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabeledCircularPercentIndicator(),
              LabeledCircularPercentIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
