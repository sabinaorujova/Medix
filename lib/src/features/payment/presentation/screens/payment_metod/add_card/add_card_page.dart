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

class AddCardDetailsPage extends StatefulWidget {
  const AddCardDetailsPage({super.key});

  @override
  _AddCardDetailsPageState createState() => _AddCardDetailsPageState();
}

class _AddCardDetailsPageState extends State<AddCardDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: AppPaddings.all16,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                GlobalButton(onTap: () {}, title: AppTexts.save),
                16.verticalSpace,
                GlobalButton(
                  onTap: () {},border: Border.all(color: AppColors.primaryFirst),
                  title: AppTexts.scan ,textStyle: AppTextStyles.greyopasity16,
                  color1: const [AppColors.white, AppColors.white],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}