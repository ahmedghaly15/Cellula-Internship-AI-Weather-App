import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_current_response.dart';

class FetchCurrentEntity {
  final String city;

  final double tempC;
  final Condition condition;
  final int windDegree;
  final int humidity;
  final int cloud;
  final double heatIndexC;

  FetchCurrentEntity({
    required this.city,
    required this.tempC,
    required this.condition,
    required this.windDegree,
    required this.humidity,
    required this.cloud,
    required this.heatIndexC,
  });
}
