import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/city_and_country_and_refresh_button.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/days_list_view_bloc_builder.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CityAndCountryAndRefreshButton(),
            ),
            SliverToBoxAdapter(
              child: DaysListViewBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
