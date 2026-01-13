import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class ClinicPrice extends StatelessWidget {
  const ClinicPrice({super.key, required this.maxPrice, required this.minPrice});
  final int maxPrice;
  final int minPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$minPrice -',
          style: TextStyle(
            color: AppColors.primaryFirst,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),4.horizontalSpace,
        Text(
          '$maxPrice',
          style: TextStyle(
            color: AppColors.primaryFirst,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}