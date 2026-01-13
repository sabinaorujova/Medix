import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key, 
    required this.children, 
    required this.formKey,
  });

  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all20,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: children),
            ),
          ),
        ),
      ),
    );
  }
}
