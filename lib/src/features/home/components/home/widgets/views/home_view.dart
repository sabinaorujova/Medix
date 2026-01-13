import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import '../listviews/pharmacy_list.dart';
import '../listviews/popular_doctors_list.dart';
import '../listviews/services_list.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/search/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.neutralLight,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Search(),
              16.verticalSpace,
              const ServicesList(),
              8.verticalSpace,
              const PharmacyList(),
              8.verticalSpace,
              const PopularDoctorsList(),
            ],
          ),
        ),
      ),
    );
  }
}