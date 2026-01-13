import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class SocialAccountsButton extends StatelessWidget {
  const SocialAccountsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 65.w,
          height: 65.h,
          decoration: BoxDecoration(color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppAssets.googleLogo,height:30,width: 30,),
          ),
        ),
       16.horizontalSpace,
        Container(
          width: 65.w,
          height: 65.h,
          decoration: BoxDecoration(color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppAssets.faceBookLogo),
          ),
        ),
      ],
    );
  }
}