import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class ClinicName extends StatelessWidget {
  const ClinicName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}