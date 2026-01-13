import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/box/global_box.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class DateItems extends StatefulWidget {
  const DateItems({super.key});

  @override
  State<DateItems> createState() => _DateItemsState();
}

class _DateItemsState extends State<DateItems> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          Color backgroundColor = selectedIndex == index
              ? AppColors.primaryFirst
              : AppColors.neutralBlue;
          Color textColor = selectedIndex == index
              ? AppColors.neutralBlue
              : AppColors.primaryFirst;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: GlobalBox(
              text: '10:30 AM',
              backColor: backgroundColor,
              textColor: textColor,
              radius: 10.r,
              fontSize: 18.sp,
            ),

          );
        },
      ),
    );
  }
}