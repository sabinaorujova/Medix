import 'package:nutri_plate/src/features/auth/data/models/auth_response.dart';


sealed class AuthState {
  const AuthState();
}


class AuthInitial extends AuthState {
  const AuthInitial();
}


class AuthLoading extends AuthState {
  const AuthLoading();
}


class AuthSuccess extends AuthState {
  final AuthResponse authResponse;
  const AuthSuccess(this.authResponse);
}


class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}