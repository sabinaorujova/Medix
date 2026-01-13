import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/auth/data/repositories/auth_repository.dart';
import 'auth_state.dart';


class AuthViewModel extends BaseViewModel<AuthState> {
  final AuthRepository _repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthViewModel(this._repository) : super(const AuthInitial());


  Future<void> login({
    required String email,
    required String password,
  }) async {
    setState(const AuthLoading());
    setLoading(true);
    clearError();

    final result = await _repository.login(
      email: email,
      password: password,
    );

    switch (result) {
      case Success(data: final data):

        if (data.token != null) {
          await _storage.write(key: 'auth_token', value: data.token);
        }
        setState(AuthSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(AuthError(message));
        setError(message);
        setLoading(false);
    }
  }


  Future<void> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    setState(const AuthLoading());
    setLoading(true);
    clearError();

    final result = await _repository.register(
      username: username,
      email: email,
      phone: phone,
      password: password,
    );

    switch (result) {
      case Success(data: final authResponse):

        if (authResponse.token != null) {
          await _storage.write(key: 'auth_token', value: authResponse.token);
        }
        setState(AuthSuccess(authResponse));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(AuthError(message));
        setError(message);
        setLoading(false);
    }
  }


  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
    setState(const AuthInitial());
  }
}