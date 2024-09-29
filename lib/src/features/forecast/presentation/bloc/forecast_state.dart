import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';

part 'forecast_state.freezed.dart';

@freezed
class ForecastState<T> with _$ForecastState<T> {
  const factory ForecastState.initial() = _Initial;
  const factory ForecastState.fetchForecastLoading() = FetchForecastLoading;
  const factory ForecastState.fetchForecastSuccess(
      FetchForecastEntity forecastEntity) = FetchForecastSuccess<T>;
  const factory ForecastState.fetchForecastError(String error) =
      FetchForecastError<T>;
}
