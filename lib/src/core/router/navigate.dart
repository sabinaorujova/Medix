import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigate {
  Navigate._();

  static void to(BuildContext context, String routeName,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters,
      Object? extra}) {
    if (pathParameters != null || queryParameters != null) {
      context.pushNamed(
        routeName,
        pathParameters: pathParameters ?? {},
        queryParameters: queryParameters ?? {},
        extra: extra,
      );
    } else {
      context.pushNamed(routeName, extra: extra);
    }
  }

  static void replace(BuildContext context, String routeName,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters,
      Object? extra}) {
    if (pathParameters != null || queryParameters != null) {
      context.pushReplacementNamed(
        routeName,
        pathParameters: pathParameters ?? {},
        queryParameters: queryParameters ?? {},
        extra: extra,
      );
    } else {
      context.pushReplacementNamed(routeName, extra: extra);
    }
  }

  static void removeAll(BuildContext context, String routeName,
      {Map<String, String>? pathParameters}) {
    if (pathParameters != null) {
      context.goNamed(
        routeName,
        pathParameters: pathParameters,
      );
    } else {
      context.goNamed(routeName);
    }
  }

  static void go(BuildContext context, String location) {
    context.go(location);
  }

  static void pop(BuildContext context, [Object? result]) {
    context.pop(result);
  }
}
