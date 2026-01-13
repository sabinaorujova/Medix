import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class HospitalRating extends StatelessWidget {
  const HospitalRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 30),
        4.horizontalSpace,
        Text(
          '4.8 (456 Reviews)',
          style: AppTextStyles.greyopasity12,
        ),
      ],
    );
  }
}