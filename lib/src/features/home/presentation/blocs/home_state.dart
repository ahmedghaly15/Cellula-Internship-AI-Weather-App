import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _HomeInitial;
  const factory HomeState.enableLocationPermissionLoading() =
      EnableLocationPermissionLoading;
  const factory HomeState.enableLocationPermissionSuccess(Position position) =
      EnableLocationPermissionSuccess<T>;
  const factory HomeState.enableLocationPermissionError() =
      EnableLocationPermissionError;
  const factory HomeState.fetchCityDataUsingPositionLoading() =
      FetchCityDataUsingPositionLoading;
  const factory HomeState.fetchCityDataUsingPositionSuccess(
          FetchCityDataEntity cityDataEntity) =
      FetchCityDataUsingPositionSuccess<T>;
  const factory HomeState.fetchCityDataUsingPositionError(String error) =
      FetchCityDataUsingPositionError<T>;
  const factory HomeState.fetchCityDataUsingCityNameLoading() =
      FetchCityDataUsingCityNameLoading;
  const factory HomeState.fetchCityDataUsingCityNameSuccess(
          FetchCityDataEntity cityDataEntity) =
      FetchCityDataUsingCityNameSuccess<T>;
  const factory HomeState.fetchCityDataUsingCityNameError(String error) =
      FetchCityDataUsingCityNameError<T>;
}
