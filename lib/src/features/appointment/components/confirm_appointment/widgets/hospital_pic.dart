import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class HospitalPic extends StatelessWidget {
  const HospitalPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164.h,
      width: 314.w,
      color: AppColors.backWhite,
      child: Image.asset(
        AppAssets.massachutess,
        fit: BoxFit.cover,
      ),
    );
  }
}