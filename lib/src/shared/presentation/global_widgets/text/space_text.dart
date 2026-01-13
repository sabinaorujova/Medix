import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class SpaceText extends StatelessWidget {

  const SpaceText({ super.key, this.colorLeft, this.colorRight, required this.textLeft,  this.textRight, this.onTap,  });

 final Color? colorLeft;
  final Color? colorRight;
  final String textLeft;
  final String? textRight;
  final void Function()? onTap;
   @override
   Widget build(BuildContext context) {
       return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textLeft,
              style: TextStyle(
                  color: colorLeft, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            GestureDetector(
              onTap:onTap,
              child: Row(
                children: [
                  GestureDetector(onTap: onTap,
                    child: Text(
                      textRight??"",
                      style: TextStyle(
                          color: colorRight,
                          fontSize: 16.sp),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.neutralGrey,
                  )
                ],
              )),
          ],
        );
  }
}