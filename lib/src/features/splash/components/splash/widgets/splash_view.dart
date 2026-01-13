import 'package:flutter/material.dart';
import 'package:nutri_plate/src/features/splash/components/splash/widgets/splash_title.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primaryFirst, AppColors.primarySecend],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: const SplashTitle());
  }
}