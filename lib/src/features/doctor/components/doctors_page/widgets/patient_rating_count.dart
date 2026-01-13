import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class PatientRatingCount extends StatelessWidget {
  const PatientRatingCount(
      {super.key,
      required this.icon,
      required this.color,
      required this.text,
      required this.count});
  final IconData icon;
  final Color color;
  final String text;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 34.w,
            height: 34.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.neutralLight)),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 14,
              ),
            )),
        4.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.greyopasity12,
            ),
            4.verticalSpace,
            Text(
              '$count+',
              style: AppTextStyles.black12,
            ),
          ],
        )
      ],
    );
  }
}