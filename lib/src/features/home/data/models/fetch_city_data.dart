import 'package:json_annotation/json_annotation.dart';

part 'fetch_city_data.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchCityData {
  @JsonKey(name: 'place_id')
  final int placeId;
  final String licence;
  @JsonKey(name: 'osm_type')
  final String osmType;
  @JsonKey(name: 'osm_id')
  final int osmId;
  final String lat;
  final String lon;
  @JsonKey(name: 'addresstype')
  final String addressType;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'address')
  final CityAddress cityAddress;

  FetchCityData({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.addressType,
    required this.displayName,
    required this.cityAddress,
  });

  factory FetchCityData.fromJson(Map<String, dynamic> json) =>
      _$FetchCityDataFromJson(json);
  Map<String, dynamic> toJson() => _$FetchCityDataToJson(this);
}

@JsonSerializable()
class CityAddress {
  final String? road, village, neighbourhood, suburb, state, postcode, country;
  @JsonKey(name: 'city')
  final String? cityName;
  @JsonKey(name: 'ISO3166-2-lvl4')
  final String? iSO31662lvl4;
  @JsonKey(name: 'country_code')
  final String? countryCode;

  CityAddress({
    this.road,
    this.village,
    this.neighbourhood,
    this.suburb,
    this.cityName,
    this.state,
    this.postcode,
    this.country,
    this.iSO31662lvl4,
    this.countryCode,
  });

  factory CityAddress.fromJson(Map<String, dynamic> json) =>
      _$CityAddressFromJson(json);
  Map<String, dynamic> toJson() => _$CityAddressToJson(this);
}
