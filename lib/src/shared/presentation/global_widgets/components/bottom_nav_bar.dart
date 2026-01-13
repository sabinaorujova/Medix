import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.onSelect, required this.currentIndex});

  final Function(int)? onSelect;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onSelect,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
              size: 32,
            ),
            title: const Text(AppTexts.home),
            selectedColor: AppColors.primaryFirst,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.menu,
              size: 32,
            ),
            title: const Text(AppTexts.menu),
            selectedColor: AppColors.primaryFirst,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.favorite,
              size: 32,
            ),
            title: const Text(AppTexts.favorite),
            selectedColor: AppColors.primaryFirst,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person,
              size: 32,
            ),
            title: const Text(AppTexts.profile),
            selectedColor: AppColors.primaryFirst,
          ),
        ]);
























  }
}