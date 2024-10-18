// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tennis_play_prediction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TennisPlayPredictionResponse _$TennisPlayPredictionResponseFromJson(
        Map<String, dynamic> json) =>
    TennisPlayPredictionResponse(
      (json['prediction'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$TennisPlayPredictionResponseToJson(
        TennisPlayPredictionResponse instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
    };
