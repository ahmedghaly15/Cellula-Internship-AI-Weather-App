import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/labeled_circular_percent_attributes.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LabeledCircularPercentIndicators extends StatelessWidget {
  const LabeledCircularPercentIndicators({
    super.key,
    required this.forecastDays,
  });

  final List<ForecastDay> forecastDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      child: BlocBuilder<ForecastBloc, ForecastState>(
        buildWhen: (_, current) => current is UpdatedSelectedDay,
        builder: (context, _) => Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 16.h,
          children: List.generate(
            _attributes(forecastDays, context).length,
            (index) => _labeledCircularPercentIndicator(
              label: _attributes(forecastDays, context)[index].label,
              percent: _attributes(forecastDays, context)[index].percent,
            ),
          ),
        ),
      ),
    );
  }

  List<LabeledCircularPercentAttributes> _attributes(
    List<ForecastDay> forecastDays,
    BuildContext context,
  ) =>
      [
        LabeledCircularPercentAttributes(
          label: 'Max temp (°C)',
          percent: forecastDays[context.read<ForecastBloc>().selectedDay]
                  .day
                  .maxTempC /
              100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Min temp (°C)',
          percent: forecastDays[context.read<ForecastBloc>().selectedDay]
                  .day
                  .minTempC /
              100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Max temp (°F)',
          percent: forecastDays[context.read<ForecastBloc>().selectedDay]
                  .day
                  .maxTempF /
              100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Min temp (°F)',
          percent: forecastDays[context.read<ForecastBloc>().selectedDay]
                  .day
                  .minTempF /
              100,
        )
      ];

  Widget _labeledCircularPercentIndicator({
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
              '${percent * 100}%',
              style: AppTextStyles.font24WhiteBold,
            ),
          ),
        ],
      );
}
