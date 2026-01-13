import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_tips_cubit/appointment_tips_cubit.dart';
import '../../../data/models/appointment_tips_model.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
class FeesInformationDetails extends StatefulWidget {
  final ValueChanged<int> onAppointmentTypeSelected; 
  final int doctorID;
  const FeesInformationDetails({Key? key, required this.onAppointmentTypeSelected, required this.doctorID, }) : super(key: key);

  @override
  _FeesInformationDetailsState createState() => _FeesInformationDetailsState();
}

class _FeesInformationDetailsState extends State<FeesInformationDetails> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentTipsCubit, List<AppointmentTips>>(
      builder: (context, appointmentTypes) {
        if (appointmentTypes.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: appointmentTypes.length,
            itemBuilder: (context, index) {
              final appointment = appointmentTypes[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onAppointmentTypeSelected(appointment.id!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex == index
                        ? AppColors.primaryFirst
                        : null,
                  ),
                  child: ListTile(
                    leading: Icon(
                      appointment.name == 'Voice Call'
                          ? Icons.phone
                          : appointment.name == 'Visit'
                              ? Icons.person
                              : Icons.video_call,
                      size: 26,
                      color: selectedIndex == index
                          ? Colors.white
                          : AppColors.primaryFirst,
                    ),
                    title: Text(
                      appointment.name ?? '',
                      style: selectedIndex == index
                          ? const TextStyle(color: Colors.white)
                          : AppTextStyles.black16,
                    ),
                    subtitle: Text(
                      'Price: ${appointment.price ?? 0}',
                      style: selectedIndex == index
                          ? const TextStyle(color: Colors.white)
                          : AppTextStyles.greyopasity12,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}