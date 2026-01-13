import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';



class ButtonArrow extends StatelessWidget {
  const ButtonArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all20,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55.h,
          width: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55.h,
              width: 55.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}