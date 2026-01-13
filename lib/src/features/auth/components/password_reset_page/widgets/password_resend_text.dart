import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class PasswordResendText extends StatelessWidget {
  const PasswordResendText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.passwordResetButtonText,
          style: AppTextStyles.greyopasity16,
        ),
        4.verticalSpace,
      Text(AppTexts.resent,style: AppTextStyles.primary16,),
      ],
    );
  }
}