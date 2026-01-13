import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double indicatorPosition;
  final double indicatorWidthRatio; 

  const MyAppBar(
      {Key? key,
      required this.indicatorPosition,
      required this.indicatorWidthRatio,
      required this.number,
      required this.text})
      : super(key: key);
  final String number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'STEP $number OF 5 : ',
            style: const TextStyle(color: AppColors.primaryFirst),
          ),
          8.horizontalSpace,
          Text(
            text,
            style: AppTextStyles.greyopasity16,
          )
        ],
      ),
      backgroundColor: AppColors.backWhite,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0), 
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width, 
              height: 4.0,
              color: AppColors.transparent,
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * indicatorPosition,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width *
                    indicatorWidthRatio, 
                height: 4.0,
                color: AppColors.primaryFirst,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}