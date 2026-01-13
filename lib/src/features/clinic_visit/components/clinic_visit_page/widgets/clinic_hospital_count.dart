import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class ClinicHospitalCount extends StatelessWidget {
  const ClinicHospitalCount({super.key, required this.countText});
  final int countText;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$countText hospital',
      style: TextStyle(
        color: AppColors.grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}