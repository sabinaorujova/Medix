import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class DependentTitle extends StatelessWidget {
  const DependentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.addDependent,
      style: AppTextStyles.black20,
    );
  }
}