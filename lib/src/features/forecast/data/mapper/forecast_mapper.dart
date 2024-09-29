import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/entities/fetch_forecast_entity.dart';

class ForecastMapper {
  ForecastMapper._();

  static FetchForecastEntity toForecastEntity(
    FetchForecastResponse forecastResponse,
  ) {
    return FetchForecastEntity(
      city: forecastResponse.location.name!,
      country: forecastResponse.location.country!,
      current: forecastResponse.current,
      forecast: forecastResponse.forecast,
    );
  }
}
