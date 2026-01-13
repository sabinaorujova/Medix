import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

import 'package:nutri_plate/src/features/auth/components/login/widgets/buttons/social_accounts_button.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/images/auth_logo.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/texts/divider_text.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/buttons/register_sign_up_button.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/buttons/signin_text_button.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/inputs/register_confirm_password_input.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/inputs/register_email_input.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/inputs/register_fullname_input.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/inputs/register_password_input.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/register_view/register_view.dart';
import 'package:nutri_plate/src/features/auth/components/register/widgets/texts/register_title_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: RegisterView(
        formKey: cubit.formkey,
        children: [
          const AuthLogo(),
          16.verticalSpace,
          const RegisterTitleText(),
          16.verticalSpace,
          const RegisterFullnameInput(),
          16.verticalSpace,
          const RegisterNumberInput(),
          16.verticalSpace,
          const RegisterEmailInput(),
          16.verticalSpace,
          const RegisterPasswordInput(),
          32.verticalSpace,
          const RegisterSignUpButton(),
          32.verticalSpace,
          const DividerText(),
          16.verticalSpace,
          const SocialAccountsButton(),
          16.verticalSpace,
          const SignInTextButton(),
        ],
      ),
    );
  }
}