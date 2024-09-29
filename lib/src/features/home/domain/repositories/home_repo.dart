import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_using_position_params.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';

import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_current_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<FetchCityDataEntity>> fetchCityDataUsingPosition(
    FetchCityDataUsingPositionParams params, [
    CancelToken? cancelToken,
  ]);

  Future<ApiResult<FetchCurrentEntity>> fetchCurrent(
    String city, [
    CancelToken? cancelToken,
  ]);

  Future<ApiResult<FetchCityDataEntity>> fetchCityDataUsingCityName(
    String cityName, [
    CancelToken? cancelToken,
  ]);
}
