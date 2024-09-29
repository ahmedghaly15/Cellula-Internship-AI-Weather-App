import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/city_search_text_field_bloc_consumer.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/custom_map_bloc_builder.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/hello_username.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/search_button_bloc_consumer.dart';

class LocationEnabledWidget extends StatelessWidget {
  const LocationEnabledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HelloUsername(),
          ),
          CustomMapBlocBuilder(),
          SliverToBoxAdapter(
            child: CitySearchTextFieldBlocConsumer(),
          ),
          SliverToBoxAdapter(
            child: SearchButtonBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
