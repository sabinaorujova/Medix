import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_create_cubit/appointment_create_cubit.dart';
import '../../../components/book_appoinment/widgets/calendar_box.dart';
import '../../../components/book_appoinment/widgets/date_items.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import '../../../components/book_appoinment/widgets/fees_information_details.dart';

class AppointmentCalendarPage extends StatefulWidget {
  const AppointmentCalendarPage({super.key, required this.doctorId});
  final int doctorId;

  @override
  _AppointmentCalendarPageState createState() => _AppointmentCalendarPageState();
}

class _AppointmentCalendarPageState extends State<AppointmentCalendarPage> {
  int? selectedAppointmentTypeId;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          AppTexts.appointment,
          style: TextStyle(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CalendarBox(onDateSelected: (date) {
                selectedDate = date;
              }),
              16.verticalSpace,
              const DateItems(),
              16.verticalSpace,
              FeesInformationDetails(
                doctorID: widget.doctorId,
                onAppointmentTypeSelected: (appointmentTypeId) {
                  selectedAppointmentTypeId = appointmentTypeId;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlobalButton(
          onTap: () {
            if (selectedDate != null && selectedAppointmentTypeId != null) {
              context.read<AppointmentCubit>().createAppointment(
                doctorId: widget.doctorId,
                time: selectedDate!,
                appointmentTypeId: selectedAppointmentTypeId!,
              );
              Navigate.to(context, 'choose-patient');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select date and appointment type')),
              );
            }
          },
          title: AppTexts.continueButton,
          icon: Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}