import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';

class PharmacyDetailsItems extends StatelessWidget {
  const PharmacyDetailsItems({
    Key? key,
    required this.pharmacyID,
    required this.pharmacyName,
    required this.location1,
    required this.locationNum, required this.number,
  }) : super(key: key);

  final String pharmacyID;
  final String pharmacyName;
  final String location1;
  final String locationNum;
    final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pharmacyName,
            style: AppTextStyles.black20,
          ),
          8.verticalSpace,
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.neutralGrey,
              ),
              Text(
                location1,
                style: AppTextStyles.naturalgrey16,
              ),
              4.horizontalSpace,
              Text(
                locationNum,
                style: AppTextStyles.naturalgrey16,
              ),
            ],
          ),
          Row(
            children: [
            const  Icon(Icons.phone_enabled_outlined,color: AppColors.neutralGrey,),
            4.horizontalSpace,
              Text(number,style: AppTextStyles.naturalgrey16,),
            ],
          )
        ],
      ),
    );
  }
}