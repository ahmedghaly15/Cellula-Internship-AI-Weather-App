import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_text_field.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_using_position_params.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';

class CitySearchTextFieldBlocConsumer extends StatelessWidget {
  const CitySearchTextFieldBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (_, current) =>
          current is FetchCityDataUsingCityNameSuccess ||
          current is FetchCityDataUsingCityNameError,
      listener: (context, state) {
        state.whenOrNull(
          fetchCityDataUsingCityNameSuccess: (cityData) {
            final fetchCityDataParams = FetchCityDataUsingPositionParams(
              lat: double.parse(cityData.lat),
              lon: double.parse(cityData.lon),
            );
            context
                .read<HomeBloc>()
                .add(FetchCityDataUsingPositionEvent(fetchCityDataParams));
          },
          fetchCityDataUsingCityNameError: (error) {
            CustomToast.showToast(
              context: context,
              message: error,
              state: CustomToastState.error,
            );
          },
        );
      },
      buildWhen: (_, current) => current is FetchCityDataUsingPositionSuccess,
      builder: (context, state) => CustomTextField(
        controller: context.read<HomeBloc>().cityController,
        hintText: 'City name',
        onChanged: (text) => context.read<HomeBloc>().debouncedCitySearch(text),
      ),
    );
  }
}
