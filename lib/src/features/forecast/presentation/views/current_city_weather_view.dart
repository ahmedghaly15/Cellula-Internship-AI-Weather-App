import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/labeled_circular_percent_attributes.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/condition_text.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/labeled_circular_percent_indicators.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/weather_image.dart';

class CurrentCityWeatherView extends StatelessWidget {
  const CurrentCityWeatherView({super.key, required this.currentCityWeather});

  final Current currentCityWeather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Current Weather')),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 32.h),
                child: ConditionText(
                  condition: currentCityWeather.condition!.text!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: LabeledCircularPercentIndicators(
                attributes: _currentIndicatorsAttributes,
              ),
            ),
            SliverToBoxAdapter(
              child: WeatherImage(
                imageUrl: currentCityWeather.condition!.icon!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<LabeledCircularPercentAttributes> get _currentIndicatorsAttributes => [
        LabeledCircularPercentAttributes(
          label: 'Temp (°C)',
          percent: currentCityWeather.tempC! / 100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Wind (km/h)',
          percent: currentCityWeather.windKph! / 10,
        ),
        LabeledCircularPercentAttributes(
          label: 'Humidity (%)',
          percent: currentCityWeather.humidity! / 100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Cloud (%)',
          percent: currentCityWeather.cloud! / 10,
        ),
      ];
}
