import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_text_field.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';

class CitySearchTextFieldBlocBuilder extends StatelessWidget {
  const CitySearchTextFieldBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, current) => current is FetchCityDataSuccess,
      builder: (context, state) => CustomTextField(
        controller: context.read<HomeBloc>().cityController,
        hintText: 'City name',
      ),
    );
  }
}
