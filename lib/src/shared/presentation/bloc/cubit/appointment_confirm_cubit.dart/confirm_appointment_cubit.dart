
import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/features/appointment/data/services/confirm_appointment_service.dart';

import 'confirm_appointment_state.dart';

class ConfirmAppointmentCubit extends Cubit<ConfirmAppointmentState> {
  final AppointmentConfirmService appointmentService =getIt<AppointmentConfirmService>();

  ConfirmAppointmentCubit() : super(ConfirmAppointmentInitial());

  void fetchAppointments() async {
    try {
      emit(ConfirmAppointmentLoading());
      final appointments = await appointmentService.fetchAppointments();
      emit(ConfirmAppointmentLoaded(appointments));
    } catch (e) {
      emit(ConfirmAppointmentError(e.toString()));
    }
  }
}