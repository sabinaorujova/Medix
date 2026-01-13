import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

/// Application logger utility.
///
/// Provides structured logging with different log levels.
/// Only logs in debug mode to avoid performance issues in production.
///
/// Example:
/// ```dart
/// AppLogger.info('User logged in', 'AuthService');
/// AppLogger.error('Failed to fetch data', tag: 'DataService', error: e);
/// ```
class AppLogger {
  AppLogger._();

  static void debug(String message, [String? tag]) {
    if (kDebugMode) {
      developer.log(
        message,
        name: tag ?? 'DEBUG',
        level: LogLevel.debug.index,
      );
    }
  }

  static void info(String message, [String? tag]) {
    if (kDebugMode) {
      developer.log(
        message,
        name: tag ?? 'INFO',
        level: LogLevel.info.index,
      );
    }
  }

  static void warning(String message,
      [String? tag, Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        message,
        name: tag ?? 'WARNING',
        level: LogLevel.warning.index,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      developer.log(
        message,
        name: tag ?? 'ERROR',
        level: LogLevel.error.index,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
