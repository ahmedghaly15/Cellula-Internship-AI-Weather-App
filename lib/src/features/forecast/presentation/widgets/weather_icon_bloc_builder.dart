import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_cached_network_image.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class WeatherIconBlocBuilder extends StatelessWidget {
  const WeatherIconBlocBuilder({
    super.key,
    required this.iconUrl,
  });

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      buildWhen: (_, current) => current is UpdatedSelectedDay,
      builder: (context, __) => CustomCachedNetworkImage(
        imageUrl: iconUrl,
        imageBuilder: (_, image) => Container(
          height: 150.h,
          width: 150.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
