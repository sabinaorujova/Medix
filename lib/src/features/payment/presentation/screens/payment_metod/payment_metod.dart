import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/custom_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/features/payment/components/payment_metod/widgets/add_dependent_card.dart';
import 'package:nutri_plate/src/features/payment/components/payment_metod/widgets/card_details.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class PaymentMetod extends StatelessWidget {
  const PaymentMetod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.addPayment,
              style: AppTextStyles.black20,
            ),
            16.verticalSpace,
            Text(
              AppTexts.paymentDescription,
              style: AppTextStyles.greyopasity16,
            ),
            24.verticalSpace,
            ListView.builder(
              itemCount: 3, 
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const CardDetails(
                    number: 'Payment at the Clinic',
                  );
                } else {
                  return Column(
                    children: [
                      const CardDetails(
                        number: '12345678',
                      ),
                      16.verticalSpace
                    ],
                  );
                }
              },
            ),
            24.verticalSpace,
            const AddDependentCard(text: 'Add New Dependent'),
            const Spacer(),
            GlobalButton(
              onTap: () {},
              title: AppTexts.save,
            )
          ],
        ),
      ),
    );
  }
}