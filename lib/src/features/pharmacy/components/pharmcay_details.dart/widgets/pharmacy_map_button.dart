import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';

class PharmacyMapButton extends StatelessWidget {
  const PharmacyMapButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all16,
      child: Expanded(
        child: GlobalButton(
          onTap: onTap,
          title: 'Go to Map',
        ),
      ),
    );
  }
}