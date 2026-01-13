import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text, this.color, this.fontSize, this.fontWeight});
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.black20 

    );
  }
}