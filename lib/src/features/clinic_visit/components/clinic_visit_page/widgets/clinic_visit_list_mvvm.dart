import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/features/clinic_visit/components/clinic_visit_page/widgets/clinic_visit_box.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/models/clinic_visit_model.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';


class ClinicVisitListMVVM extends StatefulWidget {
  final List<ClinicVisitResponse> clinics;
  final Function(int, String)? onClinicSelected;

  const ClinicVisitListMVVM({
    Key? key,
    required this.clinics,
    this.onClinicSelected,
  }) : super(key: key);

  @override
  State<ClinicVisitListMVVM> createState() => _ClinicVisitListMVVMState();
}

class _ClinicVisitListMVVMState extends State<ClinicVisitListMVVM> {
  int? selectedBoxIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        itemCount: widget.clinics.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => 8.verticalSpace,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final clinic = widget.clinics[index];
          return ClinicVisitBox(
            name: clinic.name ?? '',
            hospitalCount: clinic.numberOfHospitals ?? 0,
            maxPrice: clinic.maxPrice ?? 0,
            minPrice: clinic.minPrice ?? 0,
            img: clinic.cover ?? '',
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