import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_current_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _HomeInitial;
  const factory HomeState.enableLocationPermissionLoading() =
      EnableLocationPermissionLoading;
  const factory HomeState.enableLocationPermissionSuccess(
          LocationPermission locationPermission) =
      EnableLocationPermissionSuccess<T>;
  const factory HomeState.enableLocationPermissionError() =
      EnableLocationPermissionError;
  const factory HomeState.fetchCityDataLoading() = FetchCityDataLoading;
  const factory HomeState.fetchCityDataSuccess(
      FetchCityDataEntity cityDataEntity) = FetchCityDataSuccess<T>;
  const factory HomeState.fetchCityDataError(String error) =
      FetchCityDataError<T>;
  const factory HomeState.fetchCurrentLoading() = FetchCurrentLoading;
  const factory HomeState.fetchCurrentSuccess(
      FetchCurrentEntity currentEntity) = FetchCurrentSuccess<T>;
  const factory HomeState.fetchCurrentError(String error) =
      FetchCurrentError<T>;
}
