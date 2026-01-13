import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioException dioException = err;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        dioException = DioException(
          requestOptions: err.requestOptions,
          error: 'Connection timeout. Please check your internet connection.',
          type: err.type,
          response: err.response,
        );
        break;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        String errorMessage = 'An error occurred';

        switch (statusCode) {
          case 400:
            errorMessage = 'Bad request. Please check your input.';
            break;
          case 401:
            errorMessage = 'Unauthorized. Please login again.';
            break;
          case 403:
            errorMessage = 'Forbidden. You don\'t have permission.';
            break;
          case 404:
            errorMessage = 'Resource not found.';
            break;
          case 500:
            errorMessage = 'Internal server error. Please try again later.';
            break;
          default:
            errorMessage = 'An error occurred (Status: $statusCode)';
        }

        dioException = DioException(
          requestOptions: err.requestOptions,
          error: errorMessage,
          type: err.type,
          response: err.response,
        );
        break;

      case DioExceptionType.cancel:
        dioException = DioException(
          requestOptions: err.requestOptions,
          error: 'Request cancelled.',
          type: err.type,
        );
        break;

      case DioExceptionType.unknown:
        dioException = DioException(
          requestOptions: err.requestOptions,
          error: 'No internet connection. Please check your network.',
          type: err.type,
        );
        break;

      default:
        break;
    }

    handler.next(dioException);
  }
}