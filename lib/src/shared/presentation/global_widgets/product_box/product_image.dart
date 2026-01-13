import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
            width: 138.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              img,fit: BoxFit.contain,
            )),
        Positioned(
          left: 20,
          top: 20,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 36.w,
                height: 20.h,
                color: AppColors.neutralGrey.withOpacity(0.5),
                child: const Center(
                  child: Text(
                    'New',
                    style: TextStyle(
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
      ]),
    );
  }
}