import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/features/payment/components/payment_method/widgets/payment_method_list.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const MyAppBar(
        indicatorPosition: 0.0,
        indicatorWidthRatio: 0.0,
        number: '',
        text: AppTexts.paymentMethod,
      ),
      body: const PaymentMethodList(),
    );
  }
}