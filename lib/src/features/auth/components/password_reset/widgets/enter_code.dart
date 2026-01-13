import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          margin: AppPaddings.all16,
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,border: Border.all(width: 1,color: AppColors.grey)
          ),
          child: Center(
            child: Text(
              (index + 1).toString(),
              style:AppTextStyles.greyopasity32
            ),
          ),
        ),
      ),
    );
  }
}