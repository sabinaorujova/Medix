import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class DateTimeDetail extends StatelessWidget {
  const DateTimeDetail(
      {super.key, required this.text1, required this.text2, this.icon});
  final String text1;
  final DateTime? text2;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          8.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: AppTextStyles.black12,
              ),
              8.verticalSpace,
              Text(
                '$text2',
                style: AppTextStyles.primary16,
              )
            ],
          )
        ]);
  }
}