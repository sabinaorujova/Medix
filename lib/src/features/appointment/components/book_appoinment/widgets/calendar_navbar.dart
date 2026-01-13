import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';

class CalendarNavbar extends StatelessWidget {
  const CalendarNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all16,
      child: GlobalButton(
        onTap: () {
          Navigate.to(context, 'choose-patient');
        },
        title: AppTexts.continueButton,
        icon: Icons.arrow_forward_ios,
      ),
    );
  }
}