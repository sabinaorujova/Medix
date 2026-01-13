import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
class GoogleAccountRequest extends StatelessWidget {
  const GoogleAccountRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Or',
          style: AppTextStyles.greyopasity16,
        ),
        4.horizontalSpace,
        Container(
          height: 42,
          width: 42,
          decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: AppColors.grey,
                  offset: Offset(0,1))]),
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppAssets.googleLogo,
            width: 16.r,
            height: 16.r,
          ),
        ),
      ],
    );
  }
}