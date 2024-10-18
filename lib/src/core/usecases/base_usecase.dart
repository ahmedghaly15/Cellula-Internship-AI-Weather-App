import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';

abstract class BaseUseCase<Type, Params, CancelRequest extends CancelToken?> {
  Future<ApiResult<Type>> call(
    Params params, [
    CancelRequest? cancelToken,
  ]);
}
