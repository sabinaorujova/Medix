import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';

class DependentButton extends StatelessWidget {
  const DependentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientCubit>();
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          cubit.birthDayController.text =
              "${pickedDate.toLocal()}".split(' ')[0];
        }
      },
      child: AbsorbPointer(
        child: GlobalInput(
          hintText: AppTexts.dateBirth,
          controller: cubit.birthDayController,
        ),
      ),
    );
  }
}