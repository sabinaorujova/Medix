import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_detail_model.dart';
import '../../doctors_page/widgets/patient_rating_count.dart';
import 'doctor_specialist_box.dart';

class DoctorDetailItems extends StatelessWidget {
  const DoctorDetailItems({
    Key? key,
    required this.doctorId,
    required this.doctorName,
    required this.field,
    required this.experience,
    required this.patient,
    required this.rating, 
    required this.information, 
    required this.date,
    required this.specialists,
  }) : super(key: key);

  final int doctorId;
  final String doctorName;
  final String field;
  final String information;
  final String date;
  final int experience;
  final int patient;
  final int rating;
  final List<Specialist> specialists;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backWhite,
      child: Padding(
        padding: AppPaddings.all16,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: AppTextStyles.black20,
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Text(
                      field,
                      style: AppTextStyles.naturalgrey16,
                    ),
                    8.horizontalSpace,
                    Text(
                      AppTexts.experience,
                      style: AppTextStyles.greyopasity12,
                    )
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    PatientRatingCount(
                        icon: Icons.people,
                        color: AppColors.primaryFirst,
                        text: '$patient',
                        count: 1000),
                    16.horizontalSpace,
                    PatientRatingCount(
                        icon: Icons.star,
                        color: AppColors.orange,
                        text: '$rating',
                        count: 4),
                  ],
                ),
                16.verticalSpace,
                Text(
                  AppTexts.specialist,
                  style: AppTextStyles.black20,
                ),
                16.verticalSpace,

                SizedBox(
                  height: 39.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: specialists
                        .map((specialist) => DoctorSpecialistBox(text: specialist.name!))
                        .toList(),
                  ),
                ),
                16.verticalSpace,
                Text(
                  AppTexts.workingTime,
                  style: AppTextStyles.black20,
                ),
                8.verticalSpace,
                Text(
                  date,
                  style: AppTextStyles.naturalgrey16,
                ),
                8.verticalSpace,
                Text(
                  AppTexts.about,
                  style: AppTextStyles.black20,
                ),
                const Divider(),
                Text(
                  information,
                  style: AppTextStyles.naturalgrey16,
                ),
              ],
            ),











          ],
        ),
      ),
    );
  }
}