import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────────────────────');
      debugPrint('│ REQUEST');
      debugPrint('├─────────────────────────────────────────────────────────────');
      debugPrint('│ ${options.method} ${options.uri}');
      debugPrint('│ Headers: ${options.headers}');
      if (options.data != null) {
        debugPrint('│ Body: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        debugPrint('│ Query Parameters: ${options.queryParameters}');
      }
      debugPrint('└─────────────────────────────────────────────────────────────');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────────────────────');
      debugPrint('│ RESPONSE');
      debugPrint('├─────────────────────────────────────────────────────────────');
      debugPrint('│ ${response.requestOptions.method} ${response.requestOptions.uri}');
      debugPrint('│ Status Code: ${response.statusCode}');
      debugPrint('│ Data: ${response.data}');
      debugPrint('└─────────────────────────────────────────────────────────────');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌─────────────────────────────────────────────────────────────');
      debugPrint('│ ERROR');
      debugPrint('├─────────────────────────────────────────────────────────────');
      debugPrint('│ ${err.requestOptions.method} ${err.requestOptions.uri}');
      debugPrint('│ Status Code: ${err.response?.statusCode}');
      debugPrint('│ Error: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('│ Response Data: ${err.response?.data}');
      }
      debugPrint('└─────────────────────────────────────────────────────────────');
    }
    super.onError(err, handler);
  }
}