import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';

class AddDependentFirstname extends StatelessWidget {
  const AddDependentFirstname({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = context.read<PatientCubit>();
    return GlobalInput(
      hintText: AppTexts.enterYourFirstName,
      controller: cubit.firstNameController,
    );
  }
}