import 'package:json_annotation/json_annotation.dart';

part 'tennis_play_prediction_request.g.dart';

@JsonSerializable()
class TennisPlayPredictionRequest {
  final List<int> features;

  const TennisPlayPredictionRequest(this.features);

  factory TennisPlayPredictionRequest.fromJson(Map<String, dynamic> json) =>
      _$TennisPlayPredictionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TennisPlayPredictionRequestToJson(this);
}
