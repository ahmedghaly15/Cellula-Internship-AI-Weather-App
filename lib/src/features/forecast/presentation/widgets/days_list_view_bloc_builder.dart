import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class DaysListViewBlocBuilder extends StatelessWidget {
  const DaysListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 32.h,
      ),
      height: context.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: BlocBuilder<ForecastBloc, ForecastState>(
        buildWhen: (_, current) => current is UpdatedSelectedDay,
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
            itemBuilder: (_, index) => Container(
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
                  '29',
                  style: AppTextStyles.font24WhiteBold.copyWith(
                    color: _isSelected(index, context)
                        ? AppColors.primaryColor
                        : Colors.white,
                  ),
                ),
              ),
            ),
            separatorBuilder: (_, __) => MySizedBox.width8,
            itemCount: 7,
          );
        },
      ),
    );
  }

  bool _isSelected(int index, BuildContext context) =>
      index == context.read<ForecastBloc>().selectedDay;
}
