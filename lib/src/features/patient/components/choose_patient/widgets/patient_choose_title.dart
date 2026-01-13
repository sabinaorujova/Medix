import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class PatientChooseTitle extends StatelessWidget {
  const PatientChooseTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.choosePatient,
      style: AppTextStyles.black20,
    );
  }
}