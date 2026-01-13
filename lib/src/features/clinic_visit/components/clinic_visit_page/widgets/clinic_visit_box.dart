import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/components/listview_rounded.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'clinic_hospital_count.dart';
import 'clinic_img.dart';
import 'clinic_name.dart';
import 'clinic_price.dart';

class ClinicVisitBox extends StatelessWidget {
  final String name;
  final int hospitalCount;
  final int maxPrice;
  final int minPrice;
  final String img;
  final int index;
  final Function(int)? onTap;
  final Color? colorBorder;

  const ClinicVisitBox({
    Key? key,
    required this.name,
    required this.hospitalCount,
    required this.maxPrice,
    required this.minPrice,
    required this.img,
    required this.index,
     this.onTap,
    this.colorBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(index),
      child: ListviewRounded(
        colorBorder: colorBorder ?? Colors.transparent,
        child: Padding(
          padding: AppPaddings.all10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClinicImg(
                img: img,
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.verticalSpace,
                  ClinicName(
                    name: name,
                  ),
                  8.verticalSpace,
                  ClinicHospitalCount(
                    countText: hospitalCount,
                  ),
                  8.verticalSpace,
                  ClinicPrice(
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_rounded,
                        color: AppColors.neutralGrey,
                        size: 12.dg,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Available time',
                        style: TextStyle(
                          color: AppColors.neutralGrey,
                          fontSize: 14.sp,
                        ),
                      ),
                      32.horizontalSpace,
                      Text(
                        'Dec 32',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}