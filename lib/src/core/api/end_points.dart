class EndPoints {
  EndPoints._();

  static const String weatherApiBaseUrl = 'https://api.weatherapi.com/v1/';
  static const String openStreetApiBaseUrl =
      'https://nominatim.openstreetmap.org/';
  static const String fetchCityDataUsingPosition =
      '${openStreetApiBaseUrl}reverse?format=json';
  static const String fetchCityDataUsingCityName =
      '${openStreetApiBaseUrl}search?format=json&limit=1';
  static const String fetchForecast = 'forecast.json';
  static const String aiApiBaseUrl = 'http://127.0.0.1:5001/';
  static const String tennisPlayPrediction = '${aiApiBaseUrl}predict';
}
