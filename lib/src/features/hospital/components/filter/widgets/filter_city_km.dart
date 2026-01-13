import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class FilterCityKm extends StatefulWidget {
  const FilterCityKm({super.key});

  @override
  State<FilterCityKm> createState() => _FilterCityState();
}

class _FilterCityState extends State<FilterCityKm> {
  int selectedCityIndex=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
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
              height: 20.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: backgroundColor),
              child:  Center(
                  child: Text(
                'Florida',
                style: TextStyle(
                    fontSize: 20.sp,
                    color:textColor,
                    fontWeight: FontWeight.normal),
              )),
            ),
          );
        },
      ),
    );
  }
}