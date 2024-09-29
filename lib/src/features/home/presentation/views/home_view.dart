import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_circular_progress_indicator.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_using_position_params.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/location_denied_widget.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/location_enabled_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (_, current) => current is EnableLocationPermissionSuccess,
        listener: (context, state) {
          state.whenOrNull(
            enableLocationPermissionSuccess: (position) {
              final fetchCityDataParams = FetchCityDataUsingPositionParams(
                lat: position.latitude,
                lon: position.longitude,
              );
              context
                  .read<HomeBloc>()
                  .add(FetchCityDataUsingPositionEvent(fetchCityDataParams));
            },
          );
        },
        buildWhen: (_, current) =>
            current is EnableLocationPermissionLoading ||
            current is EnableLocationPermissionSuccess ||
            current is EnableLocationPermissionError,
        builder: (_, state) {
          if (state is EnableLocationPermissionSuccess) {
            return const LocationEnabledWidget();
          } else if (state is EnableLocationPermissionError) {
            return const LocationDeniedWidget();
          } else {
            return const Center(child: CustomCircularProgressIndicator());
          }
        },
      ),
    );
  }
}
