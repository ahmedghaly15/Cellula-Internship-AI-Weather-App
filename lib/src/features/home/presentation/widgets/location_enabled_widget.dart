import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/city_search_text_field_bloc_consumer.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/custom_map_bloc_builder.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/widgets/hello_username.dart';

class LocationEnabledWidget extends StatelessWidget {
  const LocationEnabledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HelloUsername(),
          ),
          const CustomMapBlocBuilder(),
          const SliverToBoxAdapter(
            child: CitySearchTextFieldBlocConsumer(),
          ),
          SliverToBoxAdapter(
            child: MainButton(
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              onPressed: () {},
              text: 'Search',
            ),
          ),
        ],
      ),
    );
  }
}
