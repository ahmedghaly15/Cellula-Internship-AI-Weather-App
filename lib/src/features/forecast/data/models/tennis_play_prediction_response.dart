import 'package:json_annotation/json_annotation.dart';

part 'tennis_play_prediction_response.g.dart';

@JsonSerializable()
class TennisPlayPredictionResponse {
  final List<int> prediction;

  const TennisPlayPredictionResponse(this.prediction);

  factory TennisPlayPredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$TennisPlayPredictionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TennisPlayPredictionResponseToJson(this);
}
