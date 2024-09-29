import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';

class ForecastMapper {
  ForecastMapper._();

  static FetchForecastEntity toForecastEntity(
    FetchForecastResponse currentResponse,
  ) {
    return FetchForecastEntity(
      city: currentResponse.location.name!,
      tempC: currentResponse.current.tempC!,
      condition: currentResponse.current.condition!,
      windDegree: currentResponse.current.windDegree!,
      humidity: currentResponse.current.humidity!,
      cloud: currentResponse.current.cloud!,
      heatIndexC: currentResponse.current.heatIndexC!,
      country: currentResponse.location.country!,
      forecast: currentResponse.forecast,
    );
  }
}
