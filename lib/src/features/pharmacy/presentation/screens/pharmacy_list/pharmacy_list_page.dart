import 'package:flutter/material.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/custom_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text_search_filter/text_search_filter.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/pharmacy/components/pharmacy_list_page/widgets/pharmacy_grid_view.dart';

class PharmacyListPage extends StatelessWidget {
  const PharmacyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: CustomAppBar(),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            TextSearchFilter(text: AppTexts.pharmasy),
            PharmacyGridList()
          ],
        ),
      ),
    );
  }
}