import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/login/login_page.dart';

class SignInTextButton extends StatelessWidget {
  const SignInTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const LoginPage()),
        );
      },
      child: Text(AppTexts.signIn, style: AppTextStyles.primary16),
    );
  }
}