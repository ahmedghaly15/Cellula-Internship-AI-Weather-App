import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:internship_ai_weather_app/src/core/api/end_points.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_keys.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_request.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_response.dart';

part 'forecast_api_service.g.dart';

@RestApi(baseUrl: EndPoints.weatherApiBaseUrl)
abstract class ForecastApiService {
  factory ForecastApiService(Dio dio, {String baseUrl}) = _ForecastApiService;

  @GET(EndPoints.fetchForecast)
  Future<FetchForecastResponse> fetchForecast({
    @Query('q') required String city,
    @Query('days') int days = 7,
    @Query('key') String apiKey = AppKeys.apiKey,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST(EndPoints.tennisPlayPrediction)
  Future<TennisPlayPredictionResponse> tennisPlayPrediction(
    @Body() TennisPlayPredictionRequest features, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
