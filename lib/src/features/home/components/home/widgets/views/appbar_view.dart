import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class AppbarView extends StatelessWidget implements PreferredSizeWidget {
  const AppbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.neutralLight,
      title: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppColors.black, size: 32)),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              splashRadius: 24,
              icon: const Icon(
                Icons.notifications_sharp,
                color: Color.fromARGB(255, 10, 17, 40),
                size: 32,
              ),
            ),
            Positioned(
                top: 13,
                right: 13,
                child: Container(
                  height: 10.h,
                  width: 10.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.orange),
                ))
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}