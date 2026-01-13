import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class BirthdayInput extends StatelessWidget {
  const BirthdayInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.dayOfBirth,
      style: AppTextStyles.black16,
    );
  }
}