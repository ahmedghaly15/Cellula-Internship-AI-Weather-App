class EndPoints {
  EndPoints._();

  static const String baseUrl = 'api.weatherapi.com/v1/';
  static const String fetchCurrent = '${baseUrl}current.json';
  static const String fetchCityData =
      'https://nominatim.openstreetmap.org/reverse?format=json';
}
