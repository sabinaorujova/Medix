import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class FilterSlider extends StatefulWidget {
  const FilterSlider({super.key});

  @override
  State<FilterSlider> createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  double _kilometerValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' ${_kilometerValue.round()} km',
            style:  TextStyle(fontSize: 20.sp,color: AppColors.primaryFirst),
          ),
        ),
        Slider.adaptive(
          value: _kilometerValue,
          min: 0,
          max: 100,
          divisions: 100,
          thumbColor: AppColors.primaryFirst,
          activeColor: AppColors.primaryFirst,
          inactiveColor: AppColors.neutralGrey,
          onChanged: (value) {
            setState(() {
              _kilometerValue = value;
            });
          },
        ),
      ],
    );
  }
}