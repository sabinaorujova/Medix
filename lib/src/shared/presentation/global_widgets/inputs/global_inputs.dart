import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';



class GlobalInput extends StatelessWidget {
   GlobalInput({
    Key? key,
    this.controller,
     this.hintText,
    this.isSecure = false,
    this.prefixIcon,
    this.validate,
    this.color,
    this.onChanged,this.onSaved,
    this.maxLine = 1, this.suffixIcon,
  }) : super(key: key);

  final dynamic controller;
  final String? hintText;
 final Widget? suffixIcon;
  final bool isSecure;
  final IconData? prefixIcon;
  final Color? color;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final int maxLine;
  void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isSecure,
      onSaved: onSaved,
      validator: validate,
      maxLines: maxLine,
      decoration: InputDecoration(suffixIcon: suffixIcon,
        labelStyle: AppTextStyles.greyopasity16,
        hintStyle: AppTextStyles.greyopasity16,
        filled: true,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon,
                color: color ?? AppColors.primarySecend, size: 24.sp),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyopasty),
          borderRadius: BorderRadius.circular(8),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryFirst),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryFirst),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorStyle: GoogleFonts.poppins(
          color: AppColors.red,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),  contentPadding: AppPaddings.v20h12, 
      ),
    );
  }
}