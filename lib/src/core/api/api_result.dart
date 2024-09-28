import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_ai_weather_app/src/core/api/api_error_model.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel errorModel) = Failure<T>;
}
