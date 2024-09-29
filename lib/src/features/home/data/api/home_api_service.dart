import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/end_points.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_current_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(EndPoints.fetchCurrent)
  Future<FetchCurrentResponse> fetchCurrent(
    @Query('q') String city, [
    @CancelRequest() CancelToken? cancelToken,
  ]);

  @GET(EndPoints.fetchCityData)
  Future<FetchCityData> fetchCityData({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('en') String lang = 'en',
    @CancelRequest() CancelToken? cancelToken,
  });
}
