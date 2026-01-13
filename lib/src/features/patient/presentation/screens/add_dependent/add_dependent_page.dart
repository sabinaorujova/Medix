import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/add_dependent/widgets/add_dependent_appbar.dart';
import '../../../components/add_dependent/widgets/add_dependent_name.dart';
import '../../../components/add_dependent/widgets/add_dependent_firstname.dart';
import '../../../components/add_dependent/widgets/add_dependent_lastname.dart';
import '../../../components/add_dependent/widgets/lastname_inpunt.dart';
import '../../../components/add_dependent/widgets/birthday_input.dart';
import '../../../components/add_dependent/widgets/dependent_button.dart';
import '../../../components/add_dependent/widgets/phone_title.dart';
import '../../../components/add_dependent/widgets/phone_input.dart';
import '../../../components/add_dependent/widgets/gender_group_select_button.dart';
import '../../../components/add_dependent/widgets/patient_create_button.dart';
import '../../../components/add_dependent/widgets/add_dependent_patient.dart';
import '../../../components/add_dependent/widgets/dependent_title.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_state.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';



class AddDependentPage extends StatelessWidget {
  const AddDependentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backWhite,
        appBar: const AddDependentAppbar(),
        body: Padding(
          padding: AppPaddings.all16,
          child: BlocBuilder<PatientCubit, PatientCreateState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DependentTitle(),
                    16.verticalSpace,
                    const AddDependentPatient(),
                    32.verticalSpace,
                    const AddDependentName(),
                    8.verticalSpace,
                    const AddDependentFirstname(),
                    16.verticalSpace,
                    const AddDependentLastname(),
                    8.verticalSpace,
                    const LastnameInpunt(),
                    16.verticalSpace,
                    const BirthdayInput(),
                    8.verticalSpace,
                    const DependentButton(),
                    16.verticalSpace,
                    const PhoneTitle(),
                    8.verticalSpace,
                    const PhoneInput(),
                    8.verticalSpace,
                    const GenderGroupSelectButton(),
                    16.verticalSpace,
                    const PatientCreateButton()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}