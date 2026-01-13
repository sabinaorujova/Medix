import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/features/doctor/presentation/viewmodels/doctor_detail_viewmodel.dart';
import 'package:nutri_plate/src/features/doctor/presentation/viewmodels/doctor_detail_state.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_tips_cubit/appointment_tips_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/appointment_calendar/appointment_calendar_page.dart';
import '../../../components/doctor_profile/widgets/doctor_detail_items.dart';


class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({
    Key? key,
    required this.doctorId,
  }) : super(key: key);

  final int doctorId;

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  late final DoctorDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<DoctorDetailViewModel>();
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.getDoctorDetail(widget.doctorId);
  }

  void _onViewModelChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final state = _viewModel.state;

    if (_viewModel.isLoading || state is DoctorDetailInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is DoctorDetailSuccess) {
      final doctorDetail = state.doctorDetail;
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
    }

    if (state is DoctorDetailError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _viewModel.getDoctorDetail(widget.doctorId),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}