import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';


class AdDependent extends StatelessWidget {
  const AdDependent({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backWhite,
          border: Border.all(color: AppColors.primaryFirst, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyles.primary16,
          ),
          6.horizontalSpace,
          Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
                color: AppColors.backWhite,
                border: Border.all(color: AppColors.primaryFirst, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigate.to(context, 'add-dependent');
                },
                icon: const Icon(
                  Icons.add,
                  size: 10,
                  color: AppColors.primaryFirst,
                )),
          )
        ],
      ),
    );
  }
}