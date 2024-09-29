import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_using_position_params.dart';

final class HomeEvent {}

final class EnableLocationPermissionEvent extends HomeEvent {}

final class FetchCityDataUsingPositionEvent extends HomeEvent {
  final FetchCityDataUsingPositionParams params;

  FetchCityDataUsingPositionEvent(this.params);
}

final class FetchCurrentEvent extends HomeEvent {}

final class FetchCityDataUsingCityNameEvent extends HomeEvent {
  final String cityName;

  FetchCityDataUsingCityNameEvent(this.cityName);
}
