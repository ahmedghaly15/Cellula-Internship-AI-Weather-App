import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_circular_progress_indicator.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/fetch_forecast_error_widget.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/fetch_forecast_success_widget.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ForecastBloc, ForecastState>(
          buildWhen: (_, current) =>
              current is FetchForecastLoading ||
              current is FetchForecastSuccess ||
              current is FetchForecastError,
          builder: (_, state) => state.maybeWhen(
            fetchForecastLoading: () => const Center(
              child: CustomCircularProgressIndicator(),
            ),
            fetchForecastError: (error) => FetchForecastErrorWidget(
              city: city,
              error: error,
            ),
            fetchForecastSuccess: (forecastEntity) =>
                FetchForecastSuccessWidget(forecastEntity: forecastEntity),
            orElse: () => const Center(
              child: CustomCircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
