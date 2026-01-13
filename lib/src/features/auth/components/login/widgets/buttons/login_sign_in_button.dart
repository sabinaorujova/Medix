import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/router/route_constants.dart';

import '../../../../../../shared/presentation/bloc/cubit/login/login_cubit.dart';
import '../../../../../../shared/presentation/global_widgets/buttons/global_button.dart';

class LoginButtonn extends StatelessWidget {
  const LoginButtonn({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigate.to(context, RouteConstants.homePage);
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed'),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is LoginNetwork) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Network error'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return GlobalButton(
          onTap: () {
            cubit.checkAndLogin();
          },
          title: AppTexts.signIn,
        );
      },
    );
  }
}