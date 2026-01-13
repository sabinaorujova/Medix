import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class PatientDetails extends StatelessWidget {
  const PatientDetails({
    Key? key,
    required this.name,
    required this.lastName,
    required this.birthDay,
    required this.imagePath, this.onDelete,
  }) : super(key: key);

  final String name;
  final String lastName;
  final String birthDay;
  final String imagePath;
 final  void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324.w,
      height: 115.h,
      decoration: const BoxDecoration(
        color: AppColors.backWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyopasty,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryFirst,
              radius: 30,
              child: Center(
                child: imagePath.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(imagePath,height: 60.r,width: 60.r,)
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
              ),
            ),
            8.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.black16,
                ),
                Text(
                  lastName,
                  style: AppTextStyles.black16,
                ),
                Text(
                  birthDay,
                  style: AppTextStyles.black16,
                ),

              ],
            ),
         const   Spacer(),
            IconButton(
              icon:const Icon(Icons.delete, color: AppColors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}