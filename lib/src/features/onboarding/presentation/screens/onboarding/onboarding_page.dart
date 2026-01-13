import 'package:flutter/material.dart';
import 'package:nutri_plate/src/features/onboarding/components/onbording/widgets/onboarding_view.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: OnbordingView(),
    );
  }
}