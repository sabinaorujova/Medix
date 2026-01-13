import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class PhoneTitle extends StatelessWidget {
  const PhoneTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.phoneNumber,
      style: AppTextStyles.black16,
    );
  }
}