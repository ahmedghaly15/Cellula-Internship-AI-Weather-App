// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_city_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchCityData _$FetchCityDataFromJson(Map<String, dynamic> json) =>
    FetchCityData(
      placeId: (json['place_id'] as num).toInt(),
      licence: json['licence'] as String,
      osmType: json['osm_type'] as String,
      osmId: (json['osm_id'] as num).toInt(),
      lat: json['lat'] as String,
      lon: json['lon'] as String,
      addressType: json['addresstype'] as String,
      displayName: json['display_name'] as String,
      cityAddress: json['address'] == null
          ? null
          : CityAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FetchCityDataToJson(FetchCityData instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'lat': instance.lat,
      'lon': instance.lon,
      'addresstype': instance.addressType,
      'display_name': instance.displayName,
      'address': instance.cityAddress?.toJson(),
    };

CityAddress _$CityAddressFromJson(Map<String, dynamic> json) => CityAddress(
      road: json['road'] as String?,
      village: json['village'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      suburb: json['suburb'] as String?,
      cityName: json['city'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      iSO31662lvl4: json['ISO3166-2-lvl4'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$CityAddressToJson(CityAddress instance) =>
    <String, dynamic>{
      'road': instance.road,
      'village': instance.village,
      'neighbourhood': instance.neighbourhood,
      'suburb': instance.suburb,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'city': instance.cityName,
      'ISO3166-2-lvl4': instance.iSO31662lvl4,
      'country_code': instance.countryCode,
    };
