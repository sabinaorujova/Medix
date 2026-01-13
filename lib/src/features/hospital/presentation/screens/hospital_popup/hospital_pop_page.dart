import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospoital_page/hospital_page.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_popup/book_appointment.dart';

class HospitalPopPage extends StatefulWidget {
  const HospitalPopPage({super.key});

  @override
  State<HospitalPopPage> createState() => _HospitalPopPageState();
}
 String selectedDoctorId='default id ';
class _HospitalPopPageState extends State<HospitalPopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HospitalDetailPage(
            hospitalId:selectedDoctorId,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromRGBO(17, 84, 100, 0.8).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 328.w,
              height: 450.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.backWhite,
              ),
              child:  BookAppointment(hospitalId:selectedDoctorId , ),
            ),
          ),
        ],
      ),
    );
  }
}