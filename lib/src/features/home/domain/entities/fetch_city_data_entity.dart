class FetchCityDataEntity {
  final String? cityName, country, countryCode;
  final String lat, lon;

  FetchCityDataEntity({
    this.cityName,
    this.country,
    this.countryCode,
    required this.lat,
    required this.lon,
  });
}
