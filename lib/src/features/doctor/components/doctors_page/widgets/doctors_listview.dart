import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_detail/doctor_detail_cubit.dart';
import 'package:nutri_plate/src/features/doctor/presentation/screens/doctor_profile/doctor_profile.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'doctors_box.dart';

class DoctorsListview extends StatefulWidget {
  const DoctorsListview({super.key, required this.onDoctorSelected});

  final Function(int, String)? onDoctorSelected;

  @override
  State<DoctorsListview> createState() => _DoctorsListviewState();
}

class _DoctorsListviewState extends State<DoctorsListview> {
  int selectedHospitalIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorListCubit>();

    if (cubit.doctors == null) {
      return const Center(child: Text('No doctors available'));
    }

    log('Doctors List: ${cubit.doctors}');

    return SizedBox(
      child: ListView.separated(
        itemCount: cubit.doctors!.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final doctor = cubit.doctors![index];
          Color borderColor = selectedHospitalIndex == index
              ? AppColors.primaryFirst
              : AppColors.neutralBlue;
          return DoctorsBox(
            onTap: (selectedIndex) {
              setState(() {
                selectedHospitalIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => DoctorDetailCubit(),
                      child: DoctorProfile(doctorId: doctor.id),
                    ),
                  ),
                );
              });
              widget.onDoctorSelected!(index, doctor.id.toString());
            },
            colorBorder: borderColor,
            index: doctor.id,
            name: doctor.title,
            experence: doctor.experience,
            image: doctor.cover,
            reviewCount: doctor.reviews,
            field: doctor.field,
          );
        },
        separatorBuilder: (BuildContext context, int index) => 8.verticalSpace,
      ),
    );
  }
}