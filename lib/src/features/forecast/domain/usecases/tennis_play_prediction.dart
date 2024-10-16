import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';
import 'package:internship_ai_weather_app/src/core/usecases/base_usecase.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_request.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/tennis_play_prediction_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/repositories/forecast_repo.dart';

class TennisPlayPredictionUseCase
    implements BaseUseCase<TennisPlayPredictionResponse, Current, CancelToken> {
  final ForecastRepo _forecastRepo;

  TennisPlayPredictionUseCase(this._forecastRepo);

  @override
  Future<ApiResult<TennisPlayPredictionResponse>> call(
    Current params, [
    CancelToken? cancelToken,
  ]) async {
    final TennisPlayPredictionRequest requestBody =
        _filterCurrentWeather(params);

    return await _forecastRepo.tennisPlayPrediction(requestBody, cancelToken);
  }

  TennisPlayPredictionRequest _filterCurrentWeather(Current current) {
    final int rainyCondition =
        _isCurrentConditionSunny(current.condition!.text!) ? 0 : 1;
    final int sunnyCondition = 1 - rainyCondition;
    final int hot = current.tempC! > 25 ? 1 : 0;
    final int mild = current.tempC! >= 15 || current.tempC! <= 25 ? 1 : 0;
    final int humidity = current.humidity! > 50 ? 1 : 0;
    final List<int> features = [
      rainyCondition,
      sunnyCondition,
      hot,
      mild,
      humidity
    ];
    return TennisPlayPredictionRequest(features);
  }

  bool _isCurrentConditionSunny(String condition) => condition == 'Sunny';
}
