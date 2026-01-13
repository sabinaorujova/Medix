import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class HospitalLocation extends StatelessWidget {
  const HospitalLocation({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        color: AppColors.neutralGrey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}