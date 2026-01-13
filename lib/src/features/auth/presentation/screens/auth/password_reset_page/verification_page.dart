import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';
import 'package:nutri_plate/src/features/auth/components/password_reset_page/widgets/enter_code.dart';
import 'package:nutri_plate/src/features/auth/components/password_reset_page/widgets/password_resend_text.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.verification,
          style: AppTextStyles.primary16,
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            Text(AppTexts.enterVerificationCode, style: AppTextStyles.black16),
            16.verticalSpace,
            const EnterCode(),
            16.verticalSpace,
            const PasswordResendText(),
            64.verticalSpace,
            GlobalButton(
                onTap: () {
                  Navigate.to(context, RouteConstants.newPassword);
                },
                title: AppTexts.signUp)
          ],
        ),
      ),
    );
  }
}