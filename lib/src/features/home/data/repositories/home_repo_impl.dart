import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/execute_and_handle_errors.dart';
import 'package:internship_ai_weather_app/src/features/home/data/api/home_api_service.dart';
import 'package:internship_ai_weather_app/src/features/home/data/mapper/home_mapper.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_using_position_params.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImpl(this._homeApiService);

  @override
  Future<ApiResult<FetchCityDataEntity>> fetchCityDataUsingPosition(
    FetchCityDataUsingPositionParams params, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<FetchCityDataEntity>(
      () async => await _fetchCityDataUsingPositionAndMapIt(
        params,
        cancelToken,
      ),
    );
  }

  Future<FetchCityDataEntity> _fetchCityDataUsingPositionAndMapIt(
    FetchCityDataUsingPositionParams params, [
    CancelToken? cancelToken,
  ]) async {
    final cityData = await _homeApiService.fetchCityDataUsingPosition(
      lat: params.lat,
      lon: params.lon,
      cancelToken: cancelToken,
    );
    final cityDataEntity = HomeMapper.toCityDataEntity(cityData);
    return cityDataEntity;
  }

  @override
  Future<ApiResult<FetchCityDataEntity>> fetchCityDataUsingCityName(
    String cityName, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<FetchCityDataEntity>(
      () async => await _fetchCityDataUsingCityNameAndMapIt(
        cityName,
        cancelToken,
      ),
    );
  }

  Future<FetchCityDataEntity> _fetchCityDataUsingCityNameAndMapIt(
    String cityName,
    CancelToken? cancelToken,
  ) async {
    final cityData = await _homeApiService.fetchCityDataUsingCityName(
      cityName,
      cancelToken,
    );
    final cityDataEntity = HomeMapper.toCityDataEntity(cityData[0]);
    return cityDataEntity;
  }
}
