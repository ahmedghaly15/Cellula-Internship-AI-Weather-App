import 'package:dio/dio.dart';
import 'package:internship_ai_weather_app/src/core/api/api_error_model.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_strings.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const ApiErrorModel(error: "Timeout. Please try again later");
        case DioExceptionType.sendTimeout:
          return const ApiErrorModel(error: "Timeout. Please try again later");
        case DioExceptionType.receiveTimeout:
          return const ApiErrorModel(error: "Timeout. Please try again later");
        case DioExceptionType.badResponse:
          return _handleError(error);
        case DioExceptionType.unknown:
          return _handleError(error);
        case DioExceptionType.cancel:
          return const ApiErrorModel(
            error: "Opps, something is wrong. Please try again later",
          );
        case DioExceptionType.connectionError:
          return const ApiErrorModel(error: AppStrings.noInternetConnection);
        case DioExceptionType.badCertificate:
          return const ApiErrorModel(
            error: "Opps, something is wrong. Please try again later",
          );
      }
    } else {
      return const ApiErrorModel(
        error: "Opps, something is wrong. Please try again later",
      );
    }
  }

  static ApiErrorModel _handleError(DioException error) {
    if (error.response != null &&
        error.response?.statusCode != null &&
        error.response?.statusMessage != null) {
      return ApiErrorModel.fromJson(error.response!.data);
    } else {
      return const ApiErrorModel(
        error: "Opps, something is wrong. Please try again later",
      );
    }
  }
}
