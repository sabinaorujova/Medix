import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class RegisterNumberInput extends StatelessWidget {
  const RegisterNumberInput({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return GlobalInput(
      hintText: AppTexts.mobileNumber,
      controller: cubit.numberController,
      validate:(v) {
        if (v == '') {
          return 'Field cannot be empty';
        }
        return null;
      },
      prefixIcon: Icons.phone,
      onSaved: onSaved,
    );
  }
}