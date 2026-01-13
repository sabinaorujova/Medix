import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/custom_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';


import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class CardInformation extends StatelessWidget {
   CardInformation({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const CustomAppBar(title: AppTexts.addPayment,),
      body: Padding(
        padding: AppPaddings.all16,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Scan Conpleted.Now verify your data.',style: AppTextStyles.black16,),
                16.verticalSpace,
                Center(
                  child: Image.asset(
                    AppAssets.cards,
                    height: 150.h,
                    fit: BoxFit.fill,
                  ),
                ),
                24.verticalSpace,
                GlobalInput(
                  hintText: AppTexts.cardNumber,
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: GlobalInput(
                        hintText: 'Expiration Date',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: GlobalInput(
                        hintText: 'CVV',
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                GlobalInput(
                  hintText: 'Cardholder Name',
                  maxLine: 1,
                ),
                24.verticalSpace,
                GlobalButton(onTap: () {}, title: AppTexts.continueButton),
                16.verticalSpace,

              ],
            ),
          ),
        ),
      ),
    );
  }
}