import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_list/hospital_list_cubit.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'hospital_box.dart';

class HospitalList extends StatefulWidget {
  final Function(int, String)? onHospitalSelected;
  const HospitalList({super.key, this.onHospitalSelected});

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  int selectedHospitalIndex = -1;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HospitalListCubit>();
    return SizedBox(
      child: ListView.separated(
        itemCount: cubit.hospitals!.length ,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final hospital = cubit.hospitals![index];

          return HospitalBox(
            price: hospital.price!,
            index: hospital.id!,
            img: hospital.cover!,
            name: hospital.name!,
            location: hospital.address!,
            onTap: (selectedIndex) {
              setState(() {
                selectedHospitalIndex = index;
              });
              widget.onHospitalSelected
                  ?.call(index, hospital.id.toString());
            },
            colorBorder: selectedHospitalIndex == index ? AppColors.primaryFirst : null,
          );
        },
      ),
    );
  }
}