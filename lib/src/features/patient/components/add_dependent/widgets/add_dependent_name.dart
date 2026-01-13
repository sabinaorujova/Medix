import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class AddDependentName extends StatelessWidget {
  const AddDependentName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.firstName,
      style: AppTextStyles.black16,
    );
  }
}