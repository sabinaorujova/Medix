import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_city_list/hospital_city_list_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class FilterCity extends StatefulWidget {
  const FilterCity({super.key});

  @override
  State<FilterCity> createState() => _FilterCityState();
}

class _FilterCityState extends State<FilterCity> {
  int selectedCityIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HospitalCityListCubit>();
    return SizedBox(
      height: 240,
      child: GridView.builder(
        itemCount: cubit.cities!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          final city = cubit.cities![index];
          Color backgroundColor = selectedCityIndex == index
              ? AppColors.primaryFirst
              : AppColors.neutralBlue;
          Color textColor = selectedCityIndex == index
              ? AppColors.neutralBlue
              : AppColors.primaryFirst;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCityIndex = index;
              });
            },
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: backgroundColor),
              child: Center(
                  child: Text(
                city.name!,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: textColor,
                    fontWeight: FontWeight.normal),
              )),
            ),
          );
        },
      ),
    );
  }
}