import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class ListviewRounded extends StatelessWidget {
  const ListviewRounded({super.key, this.child, required this.colorBorder});
  final Widget? child;
    final Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170.h,
        width: 343.w,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder ?? Colors.transparent, width: 2),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r)),
        child: child);
  }
}