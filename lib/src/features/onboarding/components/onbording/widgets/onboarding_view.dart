import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/features/onboarding/components/onbording/widgets/onboarding_button.dart';
import 'package:nutri_plate/src/features/onboarding/components/onbording/widgets/onboarding_image.dart';
import 'package:nutri_plate/src/features/onboarding/components/onbording/widgets/onboarding_text.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';



class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            32.verticalSpace,
            const OnboardingImage(),
            16.verticalSpace,
            const OnboardingText(),
            16.verticalSpace,
            Text(AppTexts.getAnExpertMedical, style: AppTextStyles.grey16),
            72.verticalSpace,
            const OnboardingButton()
          ],
        ),
      ),
    );
  }
}