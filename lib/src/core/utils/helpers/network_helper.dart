import 'dart:io';

/// Network helper utilities.
/// 
/// Provides methods to check network connectivity status.
class NetworkHelper {
  NetworkHelper._();

  /// Checks if device has internet connection.
  /// 
  /// Returns `true` if connected, `false` otherwise.
  /// 
  /// Example:
  /// ```dart
  /// final hasInternet = await NetworkHelper.hasConnection();
  /// if (hasInternet) {
  ///   // Proceed with network request
  /// }
  /// ```
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
