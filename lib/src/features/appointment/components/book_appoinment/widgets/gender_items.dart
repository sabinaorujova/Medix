import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/text/title_text.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class GenderItems extends StatelessWidget {
  const GenderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: AppTexts.gender),
        8.verticalSpace,
        Container(
          height: 1.h,
          color: AppColors.neutralGrey,)
      ],
    );
  }
}