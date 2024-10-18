import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_request.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';

abstract class ForecastRepo {
  Future<ApiResult<FetchForecastEntity>> fetchForecast(
    String city, [
    CancelToken? cancelToken,
  ]);

  Future<ApiResult<TennisPlayPredictionResponse>> tennisPlayPrediction(
    TennisPlayPredictionRequest features, [
    CancelToken? cancelToken,
  ]);
}
