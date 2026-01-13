import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicImg extends StatelessWidget {
  const ClinicImg({super.key,  this.img});
  final String? img;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      img??'',
      height: 146.h,
      width: 128.w,
    );
  }
}