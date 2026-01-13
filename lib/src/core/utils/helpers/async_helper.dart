import 'dart:async';

extension FutureExtensions<T> on Future<T> {
  Future<T> timeoutWithDefault(
    T defaultValue, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    try {
      return await this.timeout(timeout);
    } catch (e) {
      return defaultValue;
    }
  }
}

class AsyncHelper {
  AsyncHelper._();

  static Future<T?> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } catch (e) {
      return null;
    }
  }

  static Future<void> delay([Duration? duration]) async {
    await Future.delayed(duration ?? const Duration(milliseconds: 300));
  }
}
