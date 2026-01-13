import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_assets.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/appointment_calendar/appointment_calendar_page.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/features/doctor/presentation/screens/doctors_page/doctors_page.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key, required this.hospitalId, this.doctorId});
  final String hospitalId;
  final int? doctorId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 328.w,
        height: 480.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140.r,
                width: 140.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: AppColors.bookappointmentback,
                ),
                child: Image.asset(
                  AppAssets.bookAppointment,
                ),
              ),
              16.verticalSpace,
              Text(
                AppTexts.bookanAppointment,
                style: AppTextStyles.black24,
              ),
              16.verticalSpace,
              Text(
                AppTexts.bookAppointDescription,
                style: AppTextStyles.greyopasity12,
              ),
              16.verticalSpace,
              GlobalButton(
                onTap: () {
                  if (doctorId != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppointmentCalendarPage(doctorId: doctorId!),
                      ),
                    );
                  }
                },
                title: AppTexts.bookatime,
                icon: Icons.event_note,
              ),
              16.verticalSpace,
              GlobalButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => DoctorListCubit(),
                        child: DoctorsPage(hospitalId: hospitalId),
                      ),
                    ),
                  );
                },
                title: AppTexts.bookSpecificDoctor,
                color1: const [AppColors.backWhite, AppColors.backWhite],
                border: Border.all(color: AppColors.primaryFirst),
                textStyle: AppTextStyles.primary16,
                icon: Icons.person,
                iconColor: AppColors.primaryFirst,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
