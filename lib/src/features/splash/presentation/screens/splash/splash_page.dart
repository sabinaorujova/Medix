import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nutri_plate/src/features/splash/components/splash/widgets/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  static const String keyLogin = 'Login';
  @override
  void initState() {
    super.initState();
    wheretoGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.transparent, body: SplashView());
  }

  void wheretoGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoginIn = sharedPref.getBool('Login');

    Timer(const Duration(seconds: 2), () {
      if (isLoginIn != null) {
        if (isLoginIn) {
          Navigate.replace(context, RouteConstants.homePage);
        } else {
          Navigate.replace(context, RouteConstants.loginPage);
        }
      } else {
        Navigate.replace(context, RouteConstants.loginPage);
      }
    });
  }
}
