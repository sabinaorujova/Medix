import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class PatientChooseDescription extends StatelessWidget {
  const PatientChooseDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.findService,
      style: AppTextStyles.greyopasity12,
    );
  }
}