import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class DoctorSpecialistBox extends StatelessWidget {
  const DoctorSpecialistBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39.h,
      width: 106.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.neutralLight),
      child: Center(
        child: Text(
          text,maxLines: 1,overflow: TextOverflow.ellipsis,
          style: AppTextStyles.primary16,
        ),
      ),
    );
  }
}