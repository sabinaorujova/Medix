import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text/title_text.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class DateOfBirthItems extends StatelessWidget {

  const DateOfBirthItems({ super.key });

   @override
   Widget build(BuildContext context) {
       return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: AppTexts.dateOfBirth),
        8.verticalSpace,
         GlobalInput(
          hintText: AppTexts.dateBirth,
          prefixIcon:Icons.date_range,
        )
      ],
    );
  }
}