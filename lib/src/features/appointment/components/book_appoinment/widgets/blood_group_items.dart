import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text/title_text.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';


class BloodGroupItems extends StatelessWidget {
  const BloodGroupItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: AppTexts.bloodGroup),
        8.verticalSpace,
        SizedBox(
          height: 100,
          child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.backWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.greyopasty)),
                    height: 70.h,width: 70.w,
                    child: Center(child: Text('+AB',style: AppTextStyles.greyopasity16,))
                  ),
                );
              }),
        )
      ],
    );
  }
}