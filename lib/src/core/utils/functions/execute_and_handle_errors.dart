import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/api/api_error_handler.dart';
import 'package:internship_ai_weather_app/src/core/api/api_result.dart';

/// Executes a given asynchronous function and handles any errors that occur during its execution.
///
/// This method takes a [function] that returns a [Future] and attempts to execute it.
/// If the function completes successfully, the result is wrapped in an [ApiResult.success] object and returned.
/// If an error occurs during execution, the error is caught, logged using [debugPrint], and
/// an [ApiResult.error] object is returned with the error handled by [ApiErrorHandler].
///
/// Example usage:
/// ```dart
/// Future<ApiResult<MyData>> result = executeAndHandleErrors(() async {
///   // Your asynchronous code here
/// });
/// ```
///
/// [T] is the type of the result that the function returns.
Future<ApiResult<T>> executeAndHandleErrors<T>(
  Future<T> Function() function,
) async {
  try {
    return ApiResult<T>.success(await function());
  } catch (error) {
    log('********* Error in executeAndHandleErrors: $error **********');
    return ApiResult.failure(ApiErrorHandler.handle(error));
  }
}
