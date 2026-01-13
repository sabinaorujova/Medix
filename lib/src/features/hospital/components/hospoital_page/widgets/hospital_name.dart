import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class HospitalName extends StatelessWidget {
  const HospitalName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
     name,
      style: AppTextStyles.black20,
    );
  }
}