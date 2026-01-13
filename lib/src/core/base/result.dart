/// A sealed class representing the result of an operation.
/// 
/// Can be either [Success] with data or [Failure] with an error message.
/// 
/// Example:
/// ```dart
/// Result<String> result = await fetchData();
/// if (result.isSuccess) {
///   print(result.dataOrNull);
/// } else {
///   print(result.errorOrNull);
/// }
/// ```
sealed class Result<T> {
  const Result();
}

/// Represents a successful operation result.
/// 
/// Contains the [data] returned from the operation.
class Success<T> extends Result<T> {
  /// The data returned from the successful operation.
  final T data;
  
  const Success(this.data);
}

/// Represents a failed operation result.
/// 
/// Contains an error [message] and optional [statusCode].
class Failure<T> extends Result<T> {
  /// The error message describing what went wrong.
  final String message;
  
  /// The HTTP status code, if applicable.
  final int? statusCode;
  
  const Failure(this.message, {this.statusCode});
}

/// Extension methods for [Result] to provide convenient accessors.
extension ResultExtension<T> on Result<T> {
  /// Returns `true` if the result is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns `true` if the result is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Returns the data if successful, `null` otherwise.
  T? get dataOrNull => switch (this) {
        Success(data: final data) => data,
        Failure() => null,
      };

  /// Returns the error message if failed, `null` otherwise.
  String? get errorOrNull => switch (this) {
        Success() => null,
        Failure(message: final message) => message,
      };
}