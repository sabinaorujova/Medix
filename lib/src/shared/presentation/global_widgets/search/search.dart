import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import '../text_search_filter/clinic_search_page.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector( 
          onTap: () {
            showSearch(context: context, delegate: ClinicSearchPage());
          },
          child: Container(
            width: 260.w,
            height: 50.h,padding: AppPaddings.l16,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child:  GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: ClinicSearchPage(),
            );
          },
          child: const Align(alignment: FractionalOffset.centerLeft,
            child: Icon(Icons.search,size: 28,color: AppColors.neutralGrey,)
          ),
        ),
          ),
        ),
        8.horizontalSpace,
        Container(
          height: 50.h,
          width: 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryFirst, AppColors.primarySecend],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/images/Group.png', width: 32.w, height: 32.h),
        ),
      ],
    );
  }
}