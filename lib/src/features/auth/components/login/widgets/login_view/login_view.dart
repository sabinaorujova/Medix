import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.children, required this.formKey});
  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: AppPaddings.all20,
            child: SingleChildScrollView(
                child: Form(
                  key:formKey, child: Column(children: children)))));
  }
}