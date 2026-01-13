/// Base exception class for application errors.
/// 
/// All custom exceptions should extend this class.
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => message;
}

/// Exception thrown when network connection fails.
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'Network connection error',
    super.code = 'NETWORK_ERROR',
    super.originalError,
  });
}

/// Exception thrown when server returns an error.
class ServerException extends AppException {
  final int? statusCode;

  const ServerException({
    required super.message,
    super.code = 'SERVER_ERROR',
    this.statusCode,
    super.originalError,
  });
}

/// Exception thrown when authentication fails.
class AuthenticationException extends AppException {
  const AuthenticationException({
    super.message = 'Authentication failed',
    super.code = 'AUTH_ERROR',
    super.originalError,
  });
}

/// Exception thrown when validation fails.
class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code = 'VALIDATION_ERROR',
    super.originalError,
  });
}

/// Exception thrown when a requested resource is not found.
class NotFoundException extends AppException {
  const NotFoundException({
    super.message = 'Resource not found',
    super.code = 'NOT_FOUND',
    super.originalError,
  });
}
