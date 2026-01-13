import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import '../../../../features/payment/presentation/screens/payment_metod/payment_metod.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backWhite,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) =>const  PaymentMetod()),
          );
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        title ?? '',
        style: AppTextStyles.black20,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}