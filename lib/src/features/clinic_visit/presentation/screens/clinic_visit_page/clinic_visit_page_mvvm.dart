import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/features/clinic_visit/presentation/viewmodels/clinic_visit_viewmodel.dart';
import 'package:nutri_plate/src/features/clinic_visit/presentation/viewmodels/clinic_visit_state.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_list/hospital_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text_search_filter/text_search_filter.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_list_page/hospital_list_page.dart';
import '../../../components/clinic_visit_page/widgets/clinic_visit_list_mvvm.dart';


class ClinicVisitPageMVVM extends StatefulWidget {
  const ClinicVisitPageMVVM({Key? key}) : super(key: key);

  @override
  State<ClinicVisitPageMVVM> createState() => _ClinicVisitPageMVVMState();
}

class _ClinicVisitPageMVVMState extends State<ClinicVisitPageMVVM> {
  late final ClinicVisitViewModel _viewModel;
  int? selectedClinicIndex;
  String? selectedClinicId;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<ClinicVisitViewModel>();
    _viewModel.addListener(_onViewModelChanged);
    _viewModel.getClinic();
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
      appBar: const MyAppBar(
        indicatorPosition: 0.0,
        indicatorWidthRatio: 0.25,
        number: '1',
        text: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextSearchFilter(text: AppTexts.clinicVisit),
              16.verticalSpace,
              _buildBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlobalButton(
          onTap: () {
            if (selectedClinicId != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => HospitalListCubit(),
                    child: HospitalListPage(
                      clinicId: selectedClinicId!,
                    ),
                  ),
                ),
              );
            }
          },
          title: AppTexts.continueButton,
          icon: Icons.arrow_forward_ios,
        ),
      ),
    );
  }

  Widget _buildBody() {
    final state = _viewModel.state;

    if (_viewModel.isLoading || state is ClinicVisitInitial) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (state is ClinicVisitSuccess) {
      return ClinicVisitListMVVM(
        clinics: _viewModel.clinics ?? [],
        onClinicSelected: (clinicIndex, clinicId) {
          setState(() {
            selectedClinicIndex = clinicIndex;
            selectedClinicId = clinicId;
          });
        },
      );
    }

    if (state is ClinicVisitError) {
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
              onPressed: () => _viewModel.getClinic(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}