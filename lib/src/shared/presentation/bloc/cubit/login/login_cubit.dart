import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:nutri_plate/src/features/auth/data/models/auth_response.dart';
import 'package:nutri_plate/src/core/utils/logger/app_logger.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/core/helper/extensions/string_extensions.dart';
import '../../../../../features/auth/data/services/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  late final LoginService _loginService = getIt.get<LoginService>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final formKey = GlobalKey<FormState>();


  bool isPasswordVisible = false;
  bool isPasswordValid = false;

  Future<void> login() async {
    try {
      emit(LoginLoading());
      final AuthResponse? response = await _loginService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response != null) {
        final Box<String> authBox = Hive.box<String>('authBox');
        await authBox.put('auth_token', response.token ?? '');


        AppLogger.info('Token saved in Hive', 'LoginCubit');

        emit(LoginSuccess());
      } else {
        emit(LoginError('Login failed'));
      }
    } on SocketException catch (e) {
      AppLogger.error('Network error during login', tag: 'LoginCubit', error: e);
      emit(LoginNetwork());
    } catch (e, stackTrace) {
      AppLogger.error('Login error', tag: 'LoginCubit', error: e, stackTrace: stackTrace);
      emit(LoginError('An unexpected error occurred'));
    }
  }

  void checkAndLogin() {
    if (formKey.currentState?.validate() ?? false) {
      login();
    } else {
      AppLogger.warning('Form validation failed', 'LoginCubit');
    }
  }


  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthPasswordVisibilityChanged(isPasswordVisible));
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty) {
      return 'Email cannot be empty';
    }

    if (!value!.isValidEmail) {
      return 'Invalid email format';
    }
    return null;
  }

  void validatePassword(String password) {
    isPasswordValid = password.isValidPassword;
    emit(AuthPasswordValidationChanged(isPasswordValid));
  }


  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}