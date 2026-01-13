import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_confirm_cubit.dart/confirm_appointment_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_confirm_cubit.dart/confirm_appointment_state.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/features/appointment/components/confirm_appointment/widgets/appoinment_details.dart';
import '../../../components/confirm_appointment/widgets/confirm_app_description.dart';
import '../../../components/confirm_appointment/widgets/confirm_app_title.dart';
import '../../../components/confirm_appointment/widgets/hospital_pic.dart';
import '../../../components/confirm_appointment/widgets/date_time_detail.dart';

class ConfirmAppointmentPage extends StatelessWidget {
  const ConfirmAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const MyAppBar(
        indicatorPosition: 0.75,
        indicatorWidthRatio: 0.25,
        number: '5',
        text: '',
      ),
      body: Padding(
        padding: AppPaddings.all16,
        child: SingleChildScrollView(
          child: BlocBuilder<ConfirmAppointmentCubit, ConfirmAppointmentState>(
            builder: (context, state) {
              if (state is ConfirmAppointmentLoaded) {
                final appointments = state.appointments;

                if (appointments.isNotEmpty) {
                  final appointment = appointments.first;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      const ConfirmAppTitle(),
                      16.verticalSpace,
                      const ConfirmAppDescription(),
                      16.verticalSpace,
                      const HospitalPic(),
                      16.verticalSpace,
                      AppoinmentDetails(
                        text1: AppTexts.information,
                        text2: appointment.appointmentType ?? '',
                        icon: Icons.info_outline,
                      ),
                      16.verticalSpace,
                      DateTimeDetail(
                        text1: AppTexts.dateOfBirth,
                        text2: appointment.time,
                        icon: Icons.date_range,
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text('No appointments found'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPaddings.all16,
        child: GlobalButton(
          onTap: () {
            Navigate.to(context, 'payment-method');
          },
          title: AppTexts.continueButton,
          icon: Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}