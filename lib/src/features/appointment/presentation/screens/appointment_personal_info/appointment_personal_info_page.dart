import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import '../../../components/book_appoinment/widgets/calendar_navbar.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import '../../../components/book_appoinment/widgets/blood_group_items.dart';
import '../../../components/book_appoinment/widgets/date_of_birth_items.dart';
import '../../../components/book_appoinment/widgets/mobile_number_items.dart';
import '../../../components/book_appoinment/widgets/name_items.dart';

class AppointmentPersonalInfoPage extends StatelessWidget {
  const AppointmentPersonalInfoPage({super.key});

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
      body: Padding(
        padding: AppPaddings.all16,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NameItems(),
              16.verticalSpace,
              const DateOfBirthItems(),
              16.verticalSpace,
              const MobileNumberItems(),
              16.verticalSpace,
              const BloodGroupItems(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CalendarNavbar(),
    );
  }
}