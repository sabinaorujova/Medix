import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();


  static var primary = const TextStyle(
    color: AppColors.primaryFirst,
    fontWeight: FontWeight.w500,
  );

  static var primary32 = primary.copyWith(fontSize: 32.sp);

  static var primary16 = primary.copyWith(fontSize: 16.sp);



  static var naturalLight = const TextStyle(
    color: AppColors.neutralLight,
    fontWeight: FontWeight.w600,
  );
  static var naturalLight32 = naturalLight.copyWith(fontSize: 32.sp);
    static var naturalLight20 = naturalLight.copyWith(fontSize: 20.sp);

  static var naturalLight16 = naturalLight.copyWith(fontSize: 16.sp);


  static var grey = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: AppColors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
  static var grey32 = grey.copyWith(fontSize: 32.sp);
  static var grey16 = grey.copyWith(fontSize: 16.sp);



  static var greyopasity = GoogleFonts.poppins(
    textStyle: const TextStyle(
        color: AppColors.neutralGrey, fontWeight: FontWeight.w500),
  );
  static var greyopasity32 = greyopasity.copyWith(fontSize: 32.sp);
  static var greyopasity16 = greyopasity.copyWith(fontSize: 16.sp);
  static var greyopasity12 = greyopasity.copyWith(fontSize: 12.sp);



  static var black = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: Color.fromARGB(255, 40, 39, 39), fontWeight: FontWeight.w600),
  );
  static var black24 = black.copyWith(
    fontSize: 24.sp,
  );
  static var black20 = black.copyWith(
    fontSize: 20.sp,
  );
  static var black16 =
      black.copyWith(fontSize: 16.sp, );

    static var black14 =
      black.copyWith(fontSize: 14.sp, );

  static var black28 = black.copyWith(
    fontSize: 28.sp,
  );
  static var black12 = black.copyWith(
    fontSize: 12.sp,
  );



  static var naturalgrey = const TextStyle(
    color: AppColors.neutralGrey,
    fontWeight: FontWeight.w400,
  );
  static var naturalgrey32 =
      naturalgrey.copyWith(fontSize: 32.sp, fontWeight: FontWeight.w400);
  static var naturalgrey16 = naturalgrey.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w600);
  static var naturalgrey12 = naturalgrey.copyWith(fontSize: 12.sp);
}