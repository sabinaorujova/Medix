import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/login/login_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({super.key,  this.onSaved});

  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final cubit =context.read<LoginCubit>();
    return GlobalInput(
      hintText: AppTexts.emailAdress,
      onSaved: onSaved,
      prefixIcon: Icons.email_outlined,
      controller: cubit.emailController,validate:(v) {
          if (v == '') {
            return 'Field cannot be empty';
          }
          return null;
        } ,
    );
  }
}