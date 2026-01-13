import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class Spesifications extends StatelessWidget {
  Spesifications(
      {super.key,
      this.icon,
      required this.count,
      required this.onTap,
      required this.text});
  final IconData? icon;
  final int count;
  final String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: AppColors.black),
              4.horizontalSpace,
              Text(
                '$count',
                style: AppTextStyles.black12,
              ),
            ],
          ),
          8.verticalSpace,
          Text(
          text,
            style: AppTextStyles.greyopasity12,
          )
        ],
      ),
    );
  }
}