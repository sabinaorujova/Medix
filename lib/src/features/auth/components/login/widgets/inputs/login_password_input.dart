

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/login/login_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({super.key, this.onSaved});
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return GlobalInput(
          hintText: AppTexts.password,
          validate: (v) {
            if (v == '') {
              return 'Field cannot be empty';
            }
            return null;
          },
          controller: cubit.passwordController,
          prefixIcon: Icons.key_outlined,
          suffixIcon: IconButton(
            onPressed: cubit.togglePasswordVisibility,
            color: AppColors.neutralGrey,
            icon: Icon(
              cubit.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              size: 26,
            ),
          ),
          isSecure: !cubit.isPasswordVisible,
          onChanged: cubit.validatePassword,
          onSaved: onSaved,
        );
      },
    );
  }
}