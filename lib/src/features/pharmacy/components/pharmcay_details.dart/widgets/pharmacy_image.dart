import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyImage extends StatelessWidget {
  const PharmacyImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 370.h,
      child: Image.network(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}