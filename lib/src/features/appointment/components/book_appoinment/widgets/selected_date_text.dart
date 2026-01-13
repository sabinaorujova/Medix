import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
class SelectedDateText extends StatelessWidget {
  const SelectedDateText(
      {super.key, required this.day, required this.month, required this.year});
  final String day;
  final String month;
  final String year;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            day,
            style: TextStyle(
              color: AppColors.primaryFirst,
              fontSize: 24.sp,
            ),
          ),
          Text(
            month,
            style: TextStyle(
              color: AppColors.primaryFirst,
              fontSize: 24.sp,
            ),
          ),
          Text(
            year,
            style: TextStyle(
              color: AppColors.primaryFirst,
              fontSize: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}