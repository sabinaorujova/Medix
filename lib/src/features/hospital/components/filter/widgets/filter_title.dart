import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Filter',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
          ),
        ),
        Text(
          ' (Hospital)',
          style: TextStyle(
            color: AppColors.neutralGrey,
            fontSize: 18.sp,
          ),
        )
      ],
    );
  }
}