import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_list_cubit/patient_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_list_cubit/patient_list_create.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';
import 'package:nutri_plate/src/features/patient/components/choose_patient/widgets/patient_choose_title.dart';
import 'package:nutri_plate/src/features/patient/components/choose_patient/widgets/patient_choose_description.dart';
import 'package:nutri_plate/src/features/patient/components/choose_patient/widgets/patient_details.dart';
import 'package:nutri_plate/src/features/patient/components/choose_patient/widgets/ad_dependent.dart';

class ChoosePatientPage extends StatelessWidget {
  const ChoosePatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      appBar: const MyAppBar(
        indicatorPosition: 0.50,
        indicatorWidthRatio: 0.25,
        number: '4',
        text: '',
      ),
      body: Padding(
        padding: AppPaddings.all16,
        child: BlocProvider(
          create: (context) => PatientCreateListCubit()..fetchPatients(),
          child: BlocBuilder<PatientCreateListCubit, PatientState>(
            builder: (context, state) {
              if (state is PatientLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PatientLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      const PatientChooseTitle(),
                      16.verticalSpace,
                      const PatientChooseDescription(),
                      16.verticalSpace,
                      ListView.builder(
                        itemCount: state.patients.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final patient = state.patients[index];
                          return Padding(
                            padding: AppPaddings.all10,
                            child: PatientDetails(
                              name: patient.firstName ?? '',
                              lastName: patient.lastName ?? '',
                              birthDay:
                                  patient.birthday?.toLocal().toString() ?? '',
                              imagePath: patient.profilePhoto ?? '',
                              onDelete: () {

                              },
                            ),
                          );
                        },
                      ),
                      16.verticalSpace,
                      const AdDependent(text: AppTexts.addDependent),
                    ],
                  ),
                );
              } else if (state is PatientError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Unexpected error'));
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlobalButton(
          onTap: () {
            Navigate.to(context, 'confirm-appointment');
          },
          title: AppTexts.continueButton,
          icon: Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}