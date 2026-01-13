import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class ConfirmAppTitle extends StatelessWidget {
  const ConfirmAppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.confirmAppoinment,
      style: AppTextStyles.black20,
    );
  }
}