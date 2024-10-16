import 'package:internship_ai_weather_app/src/core/api/api_result.dart';

abstract class BaseUseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}
