import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';

class LoginRegisterPicture extends StatelessWidget {
  const LoginRegisterPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AppAssets.loginRegisterPicture),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}