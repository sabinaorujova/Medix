import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import '../../../presentation/screens/choose_patient/choose_patient_page.dart';

class PatientCreateButton extends StatelessWidget {
  const PatientCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
     final cubit = context.read<PatientCubit>();
    return GlobalButton(
      onTap: () {
        cubit.createPatient();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ChoosePatientPage(),
          ),
        );
      },
      title: AppTexts.save,
    );
  }
}