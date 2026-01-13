import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_tips_cubit/appointment_tips_cubit.dart';
import '../../../data/models/doctor_detail_model.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/doctor/data/services/doctor_detail_service.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/appointment_calendar/appointment_calendar_page.dart';
import '../../../components/doctor_profile/widgets/doctor_detail_items.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({
    Key? key,
    required this.doctorId,
  }) : super(key: key);

  final int doctorId;

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  late Future<DoctorDetailResponse> _doctorDetail;

  @override
  void initState() {
    super.initState();
    _doctorDetail = DoctorDetailService().getDoctorDetail(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: SafeArea(
        child: FutureBuilder<DoctorDetailResponse>(
          future: _doctorDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            }

            final doctorDetail = snapshot.data!;
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    doctorDetail.cover ?? '',
                    height: 400.h,
                    fit: BoxFit.fill,
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.backWhite,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.w),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: DoctorDetailItems(
                            information: doctorDetail.about!,
                            date: doctorDetail.workingTime!,
                            doctorId: widget.doctorId,
                            doctorName: doctorDetail.title!,
                            experience: doctorDetail.experience!,
                            field: doctorDetail.field!,
                            rating: doctorDetail.reviews!,
                            patient: doctorDetail.patients!,
                            specialists: doctorDetail.specialist!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: AppPaddings.all16,
                    child: GlobalButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AppointmentTipsCubit()..fetchAppointmentTypes(widget.doctorId),
                              child: AppointmentCalendarPage(
                                doctorId: widget.doctorId,
                              ),
                            ),
                          ),
                        );
                      },
                      title: AppTexts.continueButton,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}