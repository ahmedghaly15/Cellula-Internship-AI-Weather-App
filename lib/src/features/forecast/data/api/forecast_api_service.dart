import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/end_points.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_keys.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:retrofit/retrofit.dart';

part 'forecast_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ForecastApiService {
  factory ForecastApiService(Dio dio, {String baseUrl}) = _ForecastApiService;

  @GET(EndPoints.fetchForecast)
  Future<FetchForecastResponse> fetchForecast({
    @Query('q') required String city,
    @Query('days') int days = 7,
    @Query('key') String apiKey = AppKeys.apiKey,
    @CancelRequest() CancelToken? cancelToken,
  });
}
