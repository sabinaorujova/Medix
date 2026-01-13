import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'register_text_button.dart';

class RegisterClickableText extends StatelessWidget {

  const RegisterClickableText({ super.key });

   @override
   Widget build(BuildContext context) {
       return Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppTexts.requestRegister,
                        style: AppTextStyles.naturalgrey16,
                      ),
                      4.horizontalSpace,
                    const  RegisterTextButton()]);
  }
}