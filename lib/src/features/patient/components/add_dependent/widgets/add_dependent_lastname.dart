import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class AddDependentLastname extends StatelessWidget {
  const AddDependentLastname({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.lastName,
      style: AppTextStyles.black16,
    );
  }
}