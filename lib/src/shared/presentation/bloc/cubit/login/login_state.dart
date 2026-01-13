part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginNetwork extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError([this.message = 'An error occurred']);
}

class AuthPasswordVisibilityChanged extends LoginState {
  final bool isVisible;

  AuthPasswordVisibilityChanged(this.isVisible);
}

class AuthPasswordValidationChanged extends LoginState {
  final bool isValid;

  AuthPasswordValidationChanged(this.isValid);
}