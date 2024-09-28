import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data.dart';
import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_current_response.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_current_entity.dart';

class HomeMapper {
  HomeMapper._();

  static FetchCurrentEntity toCurrentEntity(
    FetchCurrentResponse currentResponse,
  ) {
    return FetchCurrentEntity(
      city: currentResponse.location!.name!,
      tempC: currentResponse.current!.tempC!,
      condition: currentResponse.current!.condition!,
      windDegree: currentResponse.current!.windDegree!,
      humidity: currentResponse.current!.humidity!,
      cloud: currentResponse.current!.cloud!,
      heatIndexC: currentResponse.current!.heatIndexC!,
    );
  }

  static FetchCityDataEntity toCityDataEntity(
    FetchCityData cityData,
  ) {
    return FetchCityDataEntity(
      cityName: cityData.cityAddress.cityName,
      country: cityData.cityAddress.country,
      countryCode: cityData.cityAddress.countryCode,
    );
  }
}
