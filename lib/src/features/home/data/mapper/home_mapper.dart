import 'package:internship_ai_weather_app/src/features/home/data/models/fetch_city_data.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/entities/fetch_city_data_entity.dart';

class HomeMapper {
  HomeMapper._();

  static FetchCityDataEntity toCityDataEntity(
    FetchCityData cityData,
  ) {
    return FetchCityDataEntity(
      cityName: cityData.cityAddress?.cityName,
      country: cityData.cityAddress?.country,
      countryCode: cityData.cityAddress?.countryCode!,
      lat: cityData.lat,
      lon: cityData.lon,
    );
  }
}
