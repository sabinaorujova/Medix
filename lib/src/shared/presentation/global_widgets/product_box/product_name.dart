import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(name,
        maxLines: 2,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ).copyWith(
          overflow: TextOverflow.ellipsis,
        ));
  }
}