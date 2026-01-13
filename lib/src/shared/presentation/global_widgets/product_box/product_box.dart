import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'box_bottom_text.dart';
import 'product_image.dart';
import 'product_name.dart';

class ProductBox extends StatelessWidget {
  const ProductBox(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      this.width,
      this.height,
      required this.name,
      required this.img});
  final String text1;
  final String text2;
  final String text3;
  final double? width;
  final double? height;
  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150.w,
      height: height ?? 213.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductImage(
              img: img,
            ),
            ProductName(
              name: name,
            ),
            BoxBottomText(text1: text1 , text2: text2, text3: text3)
          ],
        ),
      ),
    );
  }
}