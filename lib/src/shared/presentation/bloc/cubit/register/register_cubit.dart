import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nutri_plate/src/features/auth/data/models/auth_response.dart';
import 'package:nutri_plate/src/core/utils/logger/app_logger.dart';

import '../../../../../core/helper/extensions/service_locator.dart';
import '../../../../../features/auth/data/services/register_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final RegisterService _registerService = getIt.get<RegisterService>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void register() async {
    try {
      emit(RegisterLoading());
      final AuthResponse? response = await _registerService.register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: numberController.text,
      );
      if (response != null) {
        AppLogger.info('Registration successful', 'RegisterCubit');
        emit(RegisterSuccess());
      } else {
        emit(RegisterError('Registration failed'));
      }
    } on SocketException catch (e) {
      AppLogger.error('Network error during registration', tag: 'RegisterCubit', error: e);
      emit(RegisterNetwork());
    } catch (e, stackTrace) {
      AppLogger.error('Registration error', tag: 'RegisterCubit', error: e, stackTrace: stackTrace);
      emit(RegisterError('An unexpected error occurred'));
    }
  }

  void checkAndRegister() {
    if (formkey.currentState?.validate() ?? false) {
      AppLogger.debug('Form is valid, proceeding with registration', 'RegisterCubit');
      register();
    } else {
      AppLogger.warning('Form validation failed', 'RegisterCubit');
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    confirmPassController.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    return super.close();
  }
}