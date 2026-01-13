import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';

class ExploreSegmentedBar extends StatelessWidget {
  const ExploreSegmentedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        8.verticalSpace,
        SafeArea(
          child: Padding(
            padding: AppPaddings.h24,
            child:SegmentedTabControl(
              textStyle: AppTextStyles.greyopasity16,
              selectedTextStyle: AppTextStyles.greyopasity16,
              height: 40.h,
              indicatorPadding: AppPaddings.all4,
              barDecoration:const BoxDecoration(
                  color: AppColors.backWhite,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              tabTextColor: Colors.black45,
              selectedTabTextColor: Colors.white,
              splashColor: AppColors.white,
              tabs: const [
                SegmentTab(
                  label: AppTexts.clinicVisit,
                  textColor: AppColors.grey,
                  selectedTextColor: AppColors.primaryFirst,
                ),
                SegmentTab(
                    label: 'hospitals',
                    textColor: AppColors.grey,
                    selectedTextColor: AppColors.primaryFirst),

       ] ),
          ),
        ),
      ],
    );
  }
}