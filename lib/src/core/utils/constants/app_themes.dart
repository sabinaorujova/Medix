import 'package:flutter/material.dart';
import '../../styles/color_extensions.dart';
import '../../helper/extensions/configs.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();
  static ThemeData get appTheme => ThemeData(
      fontFamily: Configs.appFontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primaryFirst.toMaterialColor,
      ));
}