import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class PharmacyShoopingText extends StatelessWidget {
  const PharmacyShoopingText({super.key, required this.shopping});
  final String shopping;
  @override
  Widget build(BuildContext context) {
    return Text(shopping,
        style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.neutralGrey,
        ));
  }
}