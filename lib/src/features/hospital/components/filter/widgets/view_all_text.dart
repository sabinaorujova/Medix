import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class ViewAllText extends StatelessWidget {
  const ViewAllText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.viewAll,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
          ),
        ),
        const Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}