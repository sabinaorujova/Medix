import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/register/register_page.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => RegisterCubit(),
                    child: const RegisterPage(),
                  )),
        );
      },
      child: Text(AppTexts.register, style: AppTextStyles.primary16),
    );
  }
}