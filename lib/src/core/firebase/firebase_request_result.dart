import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_error_model.dart';

part 'firebase_request_result.freezed.dart';

@freezed
class FirebaseRequestResult<T> with _$FirebaseRequestResult<T> {
  const factory FirebaseRequestResult.success(T data) = Success<T>;
  const factory FirebaseRequestResult.failure(
    FirebaseErrorModel error,
  ) = Error<T>;
}
