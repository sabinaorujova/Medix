import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/password_reset_page/new_password_page.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';


class EmailAdressPage extends StatelessWidget {
  const EmailAdressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppTexts.forgotPasswordtitle,
            style: AppTextStyles.primary16,
          ),
        ),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: AppPaddings.all16,
          child: Column(
            children: [
              Text(
                AppTexts.enterEmailAdress,
                style: AppTextStyles.black16,
              ),
              16.verticalSpace,
               GlobalInput(hintText: AppTexts.emailAdress),
              16.verticalSpace,
              Text(
                AppTexts.backToSignIn,
                style: AppTextStyles.greyopasity16,
              ),
              64.verticalSpace,
              GlobalButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPasswordPage()));
                  },
                  title: AppTexts.send,),

            ],
          ),
        ));
  }
}