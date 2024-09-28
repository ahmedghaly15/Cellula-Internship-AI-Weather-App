import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_params.dart';

abstract class HomeEvent {}

final class FetchCityDataEvent extends HomeEvent {
  final FetchCityDataParams params;

  FetchCityDataEvent(this.params);
}

final class FetchCurrentEvent extends HomeEvent {}
