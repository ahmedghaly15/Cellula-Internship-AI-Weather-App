import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.freezed.dart';
part 'api_error_model.g.dart';

@Freezed(toJson: false, fromJson: true)
class ApiErrorModel with _$ApiErrorModel {
  const factory ApiErrorModel({
    required int code,
    @JsonKey(name: 'message') required String error,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}
