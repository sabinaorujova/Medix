import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/features/clinic_visit/components/clinic_visit_page/widgets/clinic_visit_box.dart';

import 'package:nutri_plate/src/shared/presentation/bloc/cubit/clinic_visit/clinic_visit_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';

class ClinicVisitList extends StatefulWidget {
  final Function(int, String)? onClinicSelected;

  const ClinicVisitList({Key? key, this.onClinicSelected}) : super(key: key);

  @override
  State<ClinicVisitList> createState() => _ClinicVisitListState();
}

class _ClinicVisitListState extends State<ClinicVisitList> {
  int? selectedBoxIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinicVisitCubit>();
    return SizedBox(
      child: ListView.separated(
        itemCount: cubit.clinics!.length,
        shrinkWrap: true,separatorBuilder: (context, index) => 8.verticalSpace,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final clinic = cubit.clinics![index];
          return ClinicVisitBox(
            name: clinic.name!,
            hospitalCount: clinic.numberOfHospitals!,
            maxPrice: clinic.maxPrice!,
            minPrice: clinic.minPrice!,
            img: clinic.cover!,
            index: index,
            onTap: (selectedIndex) {
              setState(() {
                selectedBoxIndex = selectedIndex;
              });
              widget.onClinicSelected?.call(selectedIndex, clinic.id.toString());
            },
            colorBorder: selectedBoxIndex == index ? AppColors.primaryFirst : null,
          );
        },
      ),
    );
  }
}