import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/login_view/login_view.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/login/login_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/buttons/login_sign_in_button.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/buttons/password_clickable_text.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/buttons/register_clickable_text.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/images/auth_logo.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/inputs/login_email_input.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/inputs/login_password_input.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/texts/app_title_text.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/texts/divider_text.dart';
import 'package:nutri_plate/src/features/auth/components/login/widgets/buttons/social_accounts_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: LoginView(formKey: cubit.formKey,
        children: [
          const AuthLogo(),
          16.verticalSpace,
          const AppTitleText(),
          16.verticalSpace,
          const LoginEmailInput(),
          16.verticalSpace,
          const LoginPasswordInput(),
          16.verticalSpace,
          const PasswordClickableText(),
          32.verticalSpace,
         const LoginButtonn(),
          32.verticalSpace,
          const DividerText(),
          16.verticalSpace,
          const SocialAccountsButton(),
          16.verticalSpace,
          const RegisterClickableText(),
        ],
      ),
    );
  }
}