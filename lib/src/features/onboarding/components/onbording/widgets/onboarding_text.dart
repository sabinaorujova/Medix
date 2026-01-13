import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.getConnectOurBestDoctors,
      style: AppTextStyles.black24,
    );
  }
}