import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_filter/hospital_filter_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/features/hospital/components/hospital_list_page/widgets/hospital_box.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_filter/hospital_filter_state.dart';

class HospitalFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalFilterCubit, HospitalFilterState>(
      builder: (context, state) {
        if (state is HospitalFilterLoading) {
          return const Scaffold(
            backgroundColor: AppColors.backWhite,
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is HospitalFilterSuccess) {
          return Scaffold(
            backgroundColor: AppColors.backWhite,
            body: ListView.separated(
              padding: AppPaddings.all12,
              itemCount: state.filteredHospitals.length,
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemBuilder: (context, index) {
                final hospital = state.filteredHospitals[index];
                return HospitalBox(
                  price: hospital.price!,
                  img: hospital.cover!,
                  name: hospital.name!,
                  location: hospital.address!,
                  index: index,

                );
              },
            ),
          );
        } else if (state is HospitalFilterFailure) {
          return Scaffold(
            backgroundColor: AppColors.backWhite,
            body: Center(child: Text(state.error)),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.backWhite,
            body: const Center(child: Text('No results')),
          );
        }
      },
    );
  }
}