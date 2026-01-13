import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'hospital_img.dart';
import 'hospital_location.dart';
import 'hospital_name.dart';
import 'rating_reviews.dart';

class HospitalBox extends StatelessWidget {
  const HospitalBox({
    super.key,
    this.onTap,
    this.colorBorder,
    required this.img,
    required this.name,
    required this.location,
    required this.index, required this.price,
  });

  final Function(int index)? onTap;
  final Color? colorBorder;
  final String name;
  final String img;
  final String location;
  final int index;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => onTap?.call(index),
        child: Container(
          height: 290.h,
          decoration: BoxDecoration(
            border:
                Border.all(color: colorBorder ?? Colors.transparent, width: 2),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HospitalImg(
                  img: img,
                  price: '$price',
                ),
                HospitalName(name: name),
                4.verticalSpace,
                HospitalLocation(location: location),
                8.verticalSpace,
                const RatingReviews(
                  rating: '4.8',
                  reviews: '(456 Reviews)',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}