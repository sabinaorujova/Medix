import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class HomeImgBox extends StatelessWidget {
  const HomeImgBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/healty_eat.png',
                ),
              )),
          child:


              const Padding(
            padding: EdgeInsets.only(top: 32, left: 16),
            child: Text(
              AppTexts.homeImgSentence,
              style: TextStyle(color: AppColors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}