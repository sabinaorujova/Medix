import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nutri_plate/src/core/errors/app_exception.dart';
import 'package:nutri_plate/src/core/utils/constants/app_strings.dart';
import 'package:nutri_plate/src/core/utils/logger/app_logger.dart';

class ErrorHandler {
  ErrorHandler._();

  static AppException handleError(dynamic error) {
    AppLogger.error('Error occurred', error: error);

    if (error is AppException) {
      return error;
    }

    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is SocketException) {
      return const NetworkException();
    }

    if (error is FormatException) {
      return AppException(
        message: 'Invalid data format',
        code: 'FORMAT_ERROR',
        originalError: error,
      );
    }

    return AppException(
      message: error.toString().isNotEmpty
          ? error.toString()
          : AppStrings.errorGeneric,
      code: 'UNKNOWN_ERROR',
      originalError: error,
    );
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] as String?;

        switch (statusCode) {
          case 400:
            return ValidationException(
              message: message ?? 'Bad request. Please check your input.',
            );
          case 401:
            return const AuthenticationException(
              message: 'Unauthorized. Please login again.',
            );
          case 403:
            return const AuthenticationException(
              message: 'Forbidden. You don\'t have permission.',
            );
          case 404:
            return const NotFoundException();
          case 500:
          case 502:
          case 503:
            return ServerException(
              message: message ?? 'Server error. Please try again later.',
              statusCode: statusCode,
            );
          default:
            return ServerException(
              message: message ?? 'An error occurred',
              statusCode: statusCode,
            );
        }

      case DioExceptionType.cancel:
        return const AppException(
          message: 'Request cancelled',
          code: 'REQUEST_CANCELLED',
        );

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NetworkException();
        }
        return AppException(
          message: error.message ?? AppStrings.errorGeneric,
          code: 'UNKNOWN_ERROR',
          originalError: error,
        );

      default:
        return AppException(
          message: error.message ?? AppStrings.errorGeneric,
          code: 'DIO_ERROR',
          originalError: error,
        );
    }
  }

  static String getErrorMessage(AppException exception) {
    return exception.message;
  }
}
