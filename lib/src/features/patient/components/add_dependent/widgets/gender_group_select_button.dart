import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/blood_list_cubit/blood_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/blood_list_cubit/blood_list_state.dart';
import 'package:nutri_plate/src/features/patient/data/models/blood_list_model.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/gender_list.cubit/gender_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/gender_list.cubit/gender_list_state.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';
import '../../../../../features/patient/data/models/gender_list_model.dart';

class GenderGroupSelectButton extends StatelessWidget {
  const GenderGroupSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<GenderCubit, GenderState>(
          builder: (context, state) {
            if (state is GenderLoading) {
              return const CircularProgressIndicator();
            } else if (state is GenderLoaded) {
              return Expanded(
                child: DropdownButtonFormField<String>(
                  items: state.genderList.map((GenderListModel gender) {
                    return DropdownMenuItem<String>(
                      value: gender.id.toString(),
                      child: Text(gender.name ?? ''),
                    );
                  }).toList(),
                  onChanged: (String? value) {

                    context.read<PatientCubit>().selectedGender =
                        value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Select Gender',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                ),
              );
            } else if (state is GenderError) {
              return Text('Error: ${state.message}');
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        BlocBuilder<BloodListCubit, BloodState>(
          builder: (context, state) {
            if (state is BloodLoading) {
              return const CircularProgressIndicator();
            } else if (state is BloodLoaded) {
              return Expanded(
                child: DropdownButtonFormField<String>(
                  items: state.bloodList.map((BloodListModel blood) {
                    return DropdownMenuItem<String>(
                      value: blood.id.toString(),
                      child: Text(blood.name ?? ''),
                    );
                  }).toList(),
                  onChanged: (String? value) {

                    context.read<PatientCubit>().selectedBlood =
                        value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Select Blood',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                ),
              );
            } else if (state is BloodError) {
              return Text('Error: ${state.message}');
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}