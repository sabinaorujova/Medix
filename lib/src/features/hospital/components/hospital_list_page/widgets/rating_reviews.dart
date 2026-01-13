import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({super.key, required this.rating, required this.reviews});
  final String rating;
  final String reviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.yellow,
        ),
        4.horizontalSpace,
        Text(
          rating,
          style: TextStyle(fontSize: 16.sp, color: AppColors.neutralGrey),
        ),
        4.horizontalSpace,
        Text(
          reviews,
          style: TextStyle(fontSize: 16.sp, color: AppColors.neutralGrey),
        ),
      ],
    );
  }
}