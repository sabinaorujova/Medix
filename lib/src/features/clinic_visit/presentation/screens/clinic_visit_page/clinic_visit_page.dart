import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_list/hospital_list_cubit.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/clinic_visit/clinic_visit_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/clinic_visit/clinic_visit_state.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text_search_filter/text_search_filter.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_list_page/hospital_list_page.dart';
import '../../../components/clinic_visit_page/widgets/clinic_visit_list.dart';

class ClinicVisitPage extends StatefulWidget {
  const ClinicVisitPage({Key? key}) : super(key: key);

  @override
  State<ClinicVisitPage> createState() => _ClinicVisitPageState();
}

class _ClinicVisitPageState extends State<ClinicVisitPage> {
  int? selectedClinicIndex;
  String? selectedClinicId;

  @override
  void initState() {
    super.initState();
    context.read<ClinicVisitCubit>().getClinic();
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
              const TextSearchFilter(text: AppTexts.clinicVisit,),
              16.verticalSpace,
              BlocBuilder<ClinicVisitCubit, ClinicVisitState>(
                  builder: (context, state) {
                if (state is ClinicVisitLoading || state is ClinicVisitInitial) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else if (state is ClinicVisitSuccess) {
                  return ClinicVisitList(
                    onClinicSelected: (clinicIndex, clinicId) {
                      setState(() {
                        selectedClinicIndex = clinicIndex;
                        selectedClinicId = clinicId;
                      });
                    },
                  );
                } else {
                  return const Text("Error loading clinics");
                }
              }),
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
}