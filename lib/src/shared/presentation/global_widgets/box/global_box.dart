import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class GlobalBox extends StatelessWidget {
  const GlobalBox({
    super.key,
    this.textColor,
    this.fontSize,
    this.height,
    this.radius,
    this.backColor,
    required this.text, this.onTap
  });
  final double? height;
  final Color? textColor;
  final Color? backColor;
  final double? fontSize;
  final double? radius;
  final String text;
  final void  Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 14.r),
          color:backColor ??  AppColors.primaryFirst,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 20.sp,
            color: textColor ?? AppColors.white,
            fontWeight: FontWeight.normal,
          ),
        )),
      ),
    );
  }
}