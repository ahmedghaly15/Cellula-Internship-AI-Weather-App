import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/execute_and_handle_errors.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/api/forecast_api_service.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/mapper/forecast_mapper.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/repositories/forecast_repo.dart';

class ForecastRepoImpl implements ForecastRepo {
  final ForecastApiService _apiService;

  ForecastRepoImpl(this._apiService);

  @override
  Future<ApiResult<FetchForecastEntity>> fetchForecast(
    String city, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<FetchForecastEntity>(
      () async => await _fetchCurrentAndMapIt(city, cancelToken),
    );
  }

  Future<FetchForecastEntity> _fetchCurrentAndMapIt(
    String city, [
    CancelToken? cancelToken,
  ]) async {
    final current = await _apiService.fetchForecast(
      city: city,
      cancelToken: cancelToken,
    );
    final currentEntity = ForecastMapper.toForecastEntity(current);
    return currentEntity;
  }
}
