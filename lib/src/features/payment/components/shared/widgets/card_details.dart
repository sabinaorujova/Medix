import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(

          children: [
            Image.asset(AppAssets.visaPicture,),
            8.horizontalSpace,
            Text(
              number,
              style: AppTextStyles.black14,
            ),
          ],
        ),
      ),
    );
  }
}