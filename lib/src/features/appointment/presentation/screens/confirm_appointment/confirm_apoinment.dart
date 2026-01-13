import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_confirm_cubit.dart/confirm_appointment_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_confirm_cubit.dart/confirm_appointment_state.dart';
import '../../../components/confirm_appointment/widgets/date_time_detail.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import '../../../components/confirm_appointment/widgets/appoinment_details.dart';
import '../../../components/confirm_appointment/widgets/confirm_app_description.dart';
import '../../../components/confirm_appointment/widgets/confirm_app_title.dart';
import '../../../components/confirm_appointment/widgets/hospital_pic.dart';

class ConfirmAppoinment extends StatelessWidget {
  const ConfirmAppoinment({super.key});

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
                      8.verticalSpace,
                      Text(
                        AppTexts.massachusetts,
                        style: AppTextStyles.black20,
                      ),
                      const Divider(
                        color: AppColors.neutralLight,
                      ),
                      16.verticalSpace,
                      AppoinmentDetails(
                        text1: AppTexts.information,
                        text2: appointment.appointmentType ?? 'No Information',
                        icon: Icons.contact_support_outlined,
                      ),
                      16.verticalSpace,
                      const AppoinmentDetails(
                        text1: AppTexts.service,
                        text2: 'hospital name',
                        icon: Icons.health_and_safety_rounded,
                      ),
                      16.verticalSpace,
                      AppoinmentDetails(
                        text1: AppTexts.doctor,
                        text2:
                            appointment.doctor?.title ?? 'No Doctor Assigned',
                        icon: Icons.person_2_outlined,
                      ),
                      16.verticalSpace,
                      DateTimeDetail(
                        text1: 'date',
                        text2: appointment.time,
                        icon: Icons.date_range,
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('No appointments available'));
                }
              } else if (state is ConfirmAppointmentError) {
                final message = state.message is int
                    ? state.message.toString()
                    : state.message;
                return Center(child: Text('Error: $message'));
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
          title: AppTexts.confirmAppoinment,
        ),
      ),
    );
  }
}