import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
class AppTitleText extends StatelessWidget {
  const AppTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppTexts.login,
        textAlign: TextAlign.center, style: AppTextStyles.black20);
  }
}