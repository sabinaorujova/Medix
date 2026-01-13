import 'package:flutter/material.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class AddDependentAppbar extends StatelessWidget implements PreferredSizeWidget  {
  const AddDependentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backWhite,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: AppColors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  } @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
