import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class DaysListViewBlocBuilder extends StatelessWidget {
  const DaysListViewBlocBuilder({super.key, required this.forecastDays});

  final List<ForecastDay> forecastDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 32.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<ForecastBloc, ForecastState>(
          buildWhen: (_, current) => current is UpdatedSelectedDay,
          builder: (context, _) => Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              forecastDays.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  borderRadius: _isSelected(index, context)
                      ? BorderRadius.circular(24.r)
                      : null,
                  color: _isSelected(index, context) ? Colors.white : null,
                ),
                child: MaterialButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minWidth: 0,
                  padding: EdgeInsets.all(16.h),
                  onPressed: () {
                    context
                        .read<ForecastBloc>()
                        .add(UpdateSelectedDayEvent(index));
                  },
                  child: Text(
                    _getDay(forecastDays[index].date),
                    style: AppTextStyles.font24WhiteBold.copyWith(
                      color: _isSelected(index, context)
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isSelected(int index, BuildContext context) =>
      index == context.read<ForecastBloc>().selectedDay;

  String _getDay(String stringDate) {
    return DateTime.parse(stringDate).day.toString();
  }
}
