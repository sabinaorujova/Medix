import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class PasswordClickableText extends StatelessWidget {
  const PasswordClickableText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppTexts.forgotPassword,
          style: AppTextStyles.naturalgrey16,
        ),
        4.horizontalSpace,
        GestureDetector(
          onTap: () {
            Navigate.to(context, RouteConstants.emailAdress);
          },
          child: Text(
            AppTexts.passwordrequest,
            style: AppTextStyles.primary16,
          ),
        ),
      ],
    );
  }
}