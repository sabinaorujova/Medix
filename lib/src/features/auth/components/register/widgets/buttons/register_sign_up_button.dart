import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class RegisterSignUpButton extends StatelessWidget {
  const RegisterSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigate.replace(context, RouteConstants.loginPage);
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
          const   SnackBar(content: Text('Register error occurred')),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        }
        return GlobalButton(
          title: AppTexts.signUp,
          onTap: () => cubit.checkAndRegister(),
        );
      },
    );
  }
}