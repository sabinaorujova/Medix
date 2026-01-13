import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class DividerText extends StatelessWidget {
  const DividerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        child: Divider(
          thickness: 1,
          color: AppColors.neutralGrey,
        ),
      ),
      8.horizontalSpace,
      Text(
        AppTexts.or,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color:AppColors.neutralGrey),
      ),
      8.horizontalSpace,
      const Expanded(
        child: Divider(
          thickness: 1,
          color: AppColors.neutralGrey,
        ),
      ),
    ]);
  }
}