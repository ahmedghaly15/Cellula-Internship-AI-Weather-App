import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';

class FetchForecastEntity {
  final String city, country;
  final double tempC;
  final Condition condition;
  final int windDegree;
  final int humidity;
  final int cloud;
  final double heatIndexC;
  final Forecast forecast;

  FetchForecastEntity({
    required this.country,
    required this.forecast,
    required this.city,
    required this.tempC,
    required this.condition,
    required this.windDegree,
    required this.humidity,
    required this.cloud,
    required this.heatIndexC,
  });
}
