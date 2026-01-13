import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showErrorSnackBar(String message) {
    showSnackBar(message, isError: true);
  }

  void showSuccessSnackBar(String message) {
    showSnackBar(message, isError: false);
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void pushNamed(String routeName, {Object? arguments}) {
    GoRouter.of(this).pushNamed(routeName, extra: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    GoRouter.of(this).pushReplacementNamed(routeName, extra: arguments);
  }

  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}
