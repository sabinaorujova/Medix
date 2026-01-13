import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class SpesificText extends StatelessWidget {
  const SpesificText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Spesifications',
      style: AppTextStyles.black16,
    );
  }
}