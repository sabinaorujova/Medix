import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'clinic_search_page.dart';

class TextSearchFilter extends StatelessWidget {
  const TextSearchFilter({super.key, this.filterOnTap, required this.text});
  final Function()? filterOnTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             text,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              AppTexts.findTheServiceYouAre,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutralGrey),
            )
          ],
        ),
        64.horizontalSpace,
        GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: ClinicSearchPage(),
            );
          },
          child: Image.asset(
            'assets/images/search_primary.png',
          ),
        ),
        24.horizontalSpace,
        GestureDetector(
          onTap: filterOnTap,
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.white),
            child: Image.asset(
              'assets/images/filter.png',
            ),
          ),
        ),
      ],
    );
  }
}