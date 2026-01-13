import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class AddDependentPatient extends StatelessWidget {
  const AddDependentPatient({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientCubit>();
    return GestureDetector(
      onTap: () {
        cubit.selectProfilePhoto();
      },
      child: Container(
        height: 63.r,
        width: 63.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.cameraContanierColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 201, 197, 197).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: cubit.profilePhoto != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.file(
                  cubit.profilePhoto!,
                  fit: BoxFit.cover,
                ),
              )
            : const Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryFirst,
                ),
              ),
      ),
    );
  }
}