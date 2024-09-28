import 'package:json_annotation/json_annotation.dart';

part 'fetch_current_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchCurrentResponse {
  final Location? location;
  final Current? current;

  FetchCurrentResponse({
    this.location,
    this.current,
  });

  factory FetchCurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchCurrentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchCurrentResponseToJson(this);
}

@JsonSerializable()
class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  @JsonKey(name: 'tz_id')
  final String? tzId;
  @JsonKey(name: 'localtime_epoch')
  final int? localTimeEpoch;
  final String? localTime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localTimeEpoch,
    this.localTime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Current {
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final double? precipMm;
  @JsonKey(name: 'precip_in')
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelsLikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelsLikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final double? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatIndexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatIndexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewPointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewPointF;
  @JsonKey(name: 'vis_km')
  final double? visKm;
  @JsonKey(name: 'vis_miles')
  final int? visMiles;
  final int? uv;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelsLikeC,
    this.feelsLikeF,
    this.windchillC,
    this.windchillF,
    this.heatIndexC,
    this.heatIndexF,
    this.dewPointC,
    this.dewPointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
