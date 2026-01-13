import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_sizedbox.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'signin_text_button.dart';

class ReguestAccountTextButton extends StatelessWidget {
  const ReguestAccountTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.requestaccount,
          style: AppTextStyles.naturalLight16,
        ),
        AppSizedboxs.w4,
        const SignInTextButton(),
      ],
    );
  }
}