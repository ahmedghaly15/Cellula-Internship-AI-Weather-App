// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tennis_play_prediction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TennisPlayPredictionRequest _$TennisPlayPredictionRequestFromJson(
        Map<String, dynamic> json) =>
    TennisPlayPredictionRequest(
      (json['features'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$TennisPlayPredictionRequestToJson(
        TennisPlayPredictionRequest instance) =>
    <String, dynamic>{
      'features': instance.features,
    };
