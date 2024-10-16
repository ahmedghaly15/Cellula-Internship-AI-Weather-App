import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_response.dart';
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
  const factory ForecastState.updateSelectedDay(int selectedDay) =
      UpdatedSelectedDay<T>;
  const factory ForecastState.tennisPlayPredictionLoading() =
      TennisPlayPredictionLoading;
  const factory ForecastState.tennisPlayPredictionSuccess(
      TennisPlayPredictionResponse response) = TennisPlayPredictionSuccess<T>;
  const factory ForecastState.tennisPlayPredictionError(String error) =
      TennisPlayPredictionError<T>;
}
