import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class RegisterEmailInput extends StatelessWidget {
  const RegisterEmailInput({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return GlobalInput(
      hintText: AppTexts.emailAdress,
      prefixIcon: Icons.email_outlined,
      onSaved: onSaved,
      controller: cubit.emailController,
      validate: (v) {
        if (v == '') {
          return 'Field cannot be empty';
        }
        return null;
      },
    );
  }
}