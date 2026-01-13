import 'package:flutter/material.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
        onTap: () {
          Navigate.to(context, RouteConstants.loginPage);
        },
        title: AppTexts.next);
  }
}