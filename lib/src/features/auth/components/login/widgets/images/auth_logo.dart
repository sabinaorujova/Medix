import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';

class AuthLogo extends StatelessWidget {

  const AuthLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.loginRegisterlogoBackround,
          fit: BoxFit.cover, 
          width: 70.w,
          height: 70.h,
          alignment: Alignment.center,
        ),
        Positioned(
          left: 10.w, 
          top: 10, 
          child: Image.asset(
            AppAssets.loginRegisterlogo,
            width: 50.w, 
            height: 50.h, 
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}