import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';



class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backWhite,
        appBar: AppBar(backgroundColor: AppColors.backWhite,
          title:  Text(AppTexts.newPassword,style: AppTextStyles.primary16,),
        ),
        body: Padding(
          padding: AppPaddings.all16,
          child: Column(mainAxisAlignment:MainAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                AppTexts.enterNewPassword,
                style: AppTextStyles.black16,
              ),
              16.verticalSpace,
               GlobalInput(hintText: AppTexts.atLeast8digits),
            24.verticalSpace,


            GlobalInput(hintText:AppTexts.newPassword ),
        64.verticalSpace,
        GlobalButton(onTap: (){}, title: AppTexts.send)
            ],
          ),
        ));
  }
}