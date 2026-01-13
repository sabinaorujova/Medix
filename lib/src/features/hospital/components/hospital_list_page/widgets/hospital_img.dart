import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class HospitalImg extends StatelessWidget {
  const HospitalImg({super.key, required this.price, required this.img});
  final String price;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.neutralLight,
          child: Image.network(fit: BoxFit.cover,
            img,
            height: 154.h,
            width: 315.w,
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 32.w,
                height: 22.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neutralGrey.withOpacity(0.5),
                ),
                child: Image.asset(
                  'assets/images/Heart.png',
                  height: 18.r,
                  width: 19.r,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 30,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 48.w,
                height: 22.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColors.neutralGrey.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}