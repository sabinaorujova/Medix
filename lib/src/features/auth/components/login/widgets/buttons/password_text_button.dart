import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

class PassswordTextButton extends StatelessWidget {
  const PassswordTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.to(context, RouteConstants.verification);
      },
      child: Text(AppTexts.password2, style: AppTextStyles.primary16),
    );
  }
}