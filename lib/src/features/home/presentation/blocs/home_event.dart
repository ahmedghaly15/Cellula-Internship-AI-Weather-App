import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_params.dart';

final class HomeEvent {}

final class EnableLocationPermissionEvent extends HomeEvent {}

final class FetchCityDataEvent extends HomeEvent {
  final FetchCityDataParams params;

  FetchCityDataEvent(this.params);
}

final class FetchCurrentEvent extends HomeEvent {}
