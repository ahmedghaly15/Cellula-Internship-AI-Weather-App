import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';

class FetchForecastErrorWidget extends StatelessWidget {
  const FetchForecastErrorWidget({
    super.key,
    required this.city,
    required this.error,
  });

  final String city, error;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh_rounded,
            color: Colors.white,
            size: 250.h,
          ),
          MySizedBox.height24,
          Text(
            error,
            style: AppTextStyles.font16WhiteBold,
          ),
          MySizedBox.height24,
          MainButton(
            onPressed: () =>
                context.read<ForecastBloc>().add(FetchForecastEvent(city)),
            text: 'Try again',
          ),
        ],
      ),
    );
  }
}
