import 'package:flutter/material.dart';

/// Application padding constants.
/// 
/// Provides consistent spacing throughout the app using EdgeInsets.
class AppPaddings {
  const AppPaddings._();

  static const all4 = EdgeInsets.all(4);
  static const all10 = EdgeInsets.all(10);
  static const all12 = EdgeInsets.all(12);
  static const all16 = EdgeInsets.all(16);
  static const all20 = EdgeInsets.all(20);
  static const all24 = EdgeInsets.all(24);
  static const l16 = EdgeInsets.only(left: 16);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const v12 = EdgeInsets.symmetric(vertical: 12);
  static const v20h12 = EdgeInsets.symmetric(vertical: 20, horizontal: 12);
    static const h24 = EdgeInsets.symmetric( horizontal:24);

}