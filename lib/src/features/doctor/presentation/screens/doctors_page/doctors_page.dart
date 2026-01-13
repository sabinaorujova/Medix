import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_list_cubit/doctor_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/doctor_list_cubit/doctor_list_state.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import '../../../components/doctors_page/widgets/doctors_listview.dart';

class DoctorsPage extends StatefulWidget {
  final String hospitalId; 

  const DoctorsPage({Key? key, required this.hospitalId}) : super(key: key); 

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  String? selectedDoctorId;
  int? selectedDoctorIndex;

  @override
  void initState() {
    super.initState();
        context.read<DoctorListCubit>().getDoctors(widget.hospitalId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        indicatorPosition: 0.0,
        indicatorWidthRatio: 0.6,
        text: AppTexts.chooseDoctors,
        number: '3',
      ),
      backgroundColor: AppColors.backWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.all16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text(
                    AppTexts.doctors,
                    style: AppTextStyles.black20,
                  ),
                  8.verticalSpace,
                  Text(
                    AppTexts.findTheServiceYouAre,
                    style: AppTextStyles.greyopasity12,
                  ),
                  16.verticalSpace,
                  BlocBuilder<DoctorListCubit, DoctorListState>(
                    builder: (context, state) {
                      if (state is DoctorListLoading ||
                          state is DoctorListInitial) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      } else if (state is DoctorListSuccess) {
                        return DoctorsListview(
                          onDoctorSelected: (index, doctorId) {
                            selectedDoctorId = doctorId;
                            selectedDoctorIndex = index;
                          },
                        );
                      } else {
                        return const Text("Error loading doctors");
                      }
                    },
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          ),

        ],
      ),bottomNavigationBar:   Padding(
            padding: AppPaddings.all16,
            child: GlobalButton(
              onTap: () {

              },
              title: AppTexts.continueButton,
            ),
          ),
    );
  } 
}