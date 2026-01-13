import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class RegisterFullnameInput extends StatelessWidget {
  const RegisterFullnameInput({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return GlobalInput(
      onSaved: onSaved,
      hintText: AppTexts.fullname,validate: (v) {
        if (v == '') {
          return 'Field cannot be empty';
        }
        return null;
      } ,
      prefixIcon: Icons.person_2_outlined,
      controller: cubit.usernameController,
    );
  }
}