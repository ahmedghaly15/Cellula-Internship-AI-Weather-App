import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_error_codes.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_error_message.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_error_model.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_strings.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handleError(dynamic error) {
    if (error is FirebaseException) {
      return _fromFirebaseCode(error.code);
    } else if (error == AppStrings.noInternetConnection) {
      return const FirebaseErrorModel(error: AppStrings.noInternetConnection);
    } else {
      return const FirebaseErrorModel(error: FirebaseErrorMessage.defaultError);
    }
  }

  static FirebaseErrorModel _fromFirebaseCode(String code) {
    switch (code) {
      case FirebaseErrorCodes.userNotFound:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.userNotFound,
        );
      case FirebaseErrorCodes.wrongPassword:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.wrongPassword,
        );
      case FirebaseErrorCodes.weakPassword:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.weakPassword,
        );
      case FirebaseErrorCodes.emailAlreadyInUse:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.emailAlreadyInUse,
        );
      case FirebaseErrorCodes.invalidEmail:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.invalidEmail,
        );
      case FirebaseErrorCodes.invalidCredential:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.invalidCredential,
        );
      case FirebaseErrorCodes.requiresRecentLogin:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.requiresRecentLogin,
        );
      case FirebaseErrorCodes.networkRequestFailed:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.networkRequestFailed,
        );
      case FirebaseErrorCodes.userDisabled:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.userDisabled,
        );
      case FirebaseErrorCodes.userTokenExpired:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.userTokenExpired,
        );
      default:
        return const FirebaseErrorModel(
          error: FirebaseErrorMessage.defaultError,
        );
    }
  }
}
