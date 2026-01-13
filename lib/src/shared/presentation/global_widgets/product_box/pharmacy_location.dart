import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class PharmacyLocation extends StatelessWidget {
  const PharmacyLocation({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.neutralGrey,
          fontWeight: FontWeight.w500),
    );
  }
}