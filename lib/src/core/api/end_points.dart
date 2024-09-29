class EndPoints {
  EndPoints._();

  static const String baseUrl = 'https://api.weatherapi.com/v1/';
  static const String fetchCityDataUsingPosition =
      'https://nominatim.openstreetmap.org/reverse?format=json';
  static const String fetchCityDataUsingCityName =
      'https://nominatim.openstreetmap.org/search?format=json&limit=1';
  static const String fetchForecast = 'forecast.json';
}
