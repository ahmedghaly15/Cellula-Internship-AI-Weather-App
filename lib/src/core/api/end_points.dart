class EndPoints {
  EndPoints._();

  static const String weatherApiBaseUrl = 'https://api.weatherapi.com/v1/';
  static const String openStreetBaseUrl =
      'https://nominatim.openstreetmap.org/';
  static const String fetchCityDataUsingPosition =
      '${openStreetBaseUrl}reverse?format=json';
  static const String fetchCityDataUsingCityName =
      '${openStreetBaseUrl}search?format=json&limit=1';
  static const String fetchForecast = 'forecast.json';
}
