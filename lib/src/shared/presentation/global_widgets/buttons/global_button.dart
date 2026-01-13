import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.isLoadings = false,
    this.icon,
    this.color1 = const [AppColors.primaryFirst, AppColors.primarySecend],
    this.border, this.textStyle, this.iconColor= AppColors.white,
  }) : super(key: key);

  final void Function() onTap;
  final String title;
  final bool isLoadings;
  final List<Color> color1;
  final IconData? icon;
  final BoxBorder? border;
   final Color? iconColor;
 final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: color1.length == 2 ? color1 : [color1[0], color1[0]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            border: border),
        child: isLoadings
            ? const CircularProgressIndicator.adaptive()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: textStyle??AppTextStyles.naturalLight20
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    icon,
                    color:iconColor,
                    size: 18,
                  ),
                ],
              ),
      ),
    );
  }
}