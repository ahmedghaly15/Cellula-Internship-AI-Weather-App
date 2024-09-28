import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/execute_and_handle_errors.dart';
import 'package:internship_ai_weather_app/src/features/home/data/api/home_api_service.dart';
import 'package:internship_ai_weather_app/src/features/home/data/mapper/home_mapper.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data_params.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_current_entity.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImpl(this._homeApiService);

  @override
  Future<ApiResult<FetchCityData>> fetchCityData(
    FetchCityDataParams params, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<FetchCityData>(
      () async => await _homeApiService.fetchCityData(
        lat: params.lat,
        lon: params.lon,
      ),
    );
  }

  @override
  Future<ApiResult<FetchCurrentEntity>> fetchCurrent(
    String city, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<FetchCurrentEntity>(
      () async {
        final current = await _homeApiService.fetchCurrent(city);
        final currentEntity = HomeMapper.toCurrentEntity(current);
        return currentEntity;
      },
    );
  }
}
