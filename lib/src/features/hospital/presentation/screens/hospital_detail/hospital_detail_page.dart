import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/features/hospital/presentation/viewmodels/hospital_detail_viewmodel.dart';
import 'package:nutri_plate/src/features/hospital/presentation/viewmodels/hospital_detail_state.dart';
import '../../../../doctor/presentation/screens/doctors_page/doctors_page.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:nutri_plate/src/features/hospital/components/hospital_list_page/widgets/hospital_location.dart';
import 'package:nutri_plate/src/features/hospital/components/hospital_list_page/widgets/hospital_name.dart';
import 'package:nutri_plate/src/features/hospital/components/hospoital_page/widgets/hospital_rating.dart';
import 'package:nutri_plate/src/features/hospital/components/hospoital_page/widgets/spesific_text.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_popup/book_appointment.dart';
import 'package:nutri_plate/src/features/hospital/components/hospoital_page/widgets/spesifications.dart';


class HospitalDetailPage extends StatefulWidget {
  final String hospitalId;

  const HospitalDetailPage({Key? key, required this.hospitalId})
      : super(key: key);

  @override
  _HospitalDetailPageState createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  late final HospitalDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<HospitalDetailViewModel>();
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.getHospitalDetail(int.parse(widget.hospitalId));
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
      body: Padding(
        padding: AppPaddings.all16,
        child: _buildBody(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlobalButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: AppPaddings.all10,
                  content: Container(
                    width: 328.w,
                    height: 480.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backWhite,
                    ),
                    child: BookAppointment(hospitalId: widget.hospitalId),
                  ),
                );
              },
            );
          },
          title: 'Continue',
        ),
      ),
    );
  }

  Widget _buildBody() {
    final state = _viewModel.state;

    if (_viewModel.isLoading || state is HospitalDetailInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is HospitalDetailSuccess) {
      final hospitalDetail = state.hospitalDetail;
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400.h,
              width: 355.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(hospitalDetail.cover ?? ''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            16.verticalSpace,
            HospitalName(name: hospitalDetail.name ?? ''),
            8.verticalSpace,
            HospitalLocation(location: hospitalDetail.address ?? ''),
            8.verticalSpace,
            const HospitalRating(),
            16.verticalSpace,
            const SpesificText(),
            24.verticalSpace,
            Row(
              children: [
                Spesifications(
                  count: hospitalDetail.rooms ?? 0,
                  text: 'Rooms',
                  icon: Icons.home,
                  onTap: () {},
                ),
                90.horizontalSpace,
                Spesifications(
                  count: hospitalDetail.numberOfDoctors ?? 0,
                  text: 'Doctors',
                  icon: Icons.person,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => DoctorListCubit()
                          ..getDoctors(widget.hospitalId.toString()),
                        child: DoctorsPage(hospitalId: widget.hospitalId),
                      ),
                    ),
                  ),
                ),
                90.horizontalSpace,
                Spesifications(
                  count: hospitalDetail.acreage ?? 0,
                  text: 'Acreage',
                  icon: Icons.location_on_sharp,
                  onTap: () {},
                ),
              ],
            ),
            16.verticalSpace,
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.verticalSpace,
            Text(
              hospitalDetail.description ?? '',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      );
    }

    if (state is HospitalDetailError) {
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
              onPressed: () =>
                  _viewModel.getHospitalDetail(int.parse(widget.hospitalId)),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}