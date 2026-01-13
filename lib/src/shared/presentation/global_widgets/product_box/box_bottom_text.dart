import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class BoxBottomText extends StatelessWidget {
  const BoxBottomText({super.key, required this.text1, required this.text2, required this.text3});
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                text1,
                style: TextStyle(
                    fontSize: 15.sp,  overflow: TextOverflow.ellipsis,
                    color: AppColors.neutralGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            4.horizontalSpace,
            Expanded(
              child: Text(
                text2,
                style: TextStyle(
                  fontSize: 15.sp,  overflow: TextOverflow.ellipsis,
                  color: AppColors.neutralGrey,
                ),
              ),
            ),
          ],
        ),
        Text(
          text3,
          style: TextStyle(
            fontSize: 15.sp,  overflow: TextOverflow.ellipsis,
            color: AppColors.neutralGrey,
          ),
        ),
      ],
    );
  }
}