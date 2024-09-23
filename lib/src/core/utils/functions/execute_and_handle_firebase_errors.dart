import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_error_handler.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_request_result.dart';
import 'package:internship_ai_weather_app/src/core/network/internet_checker.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_strings.dart';

Future<FirebaseRequestResult<T>> executeAndHandleFirebaseErrors<T>(
  Future Function() function,
) async {
  if (await getIt.get<InternetChecker>().isConnected) {
    try {
      final response = await function();
      return FirebaseRequestResult<T>.success(response);
    } catch (error) {
      debugPrint('********* Firebase error: $error ***********');

      return FirebaseRequestResult.failure(
        FirebaseErrorHandler.handleError(error),
      );
    }
  } else {
    return FirebaseRequestResult.failure(
      FirebaseErrorHandler.handleError(AppStrings.noInternetConnection),
    );
  }
}
