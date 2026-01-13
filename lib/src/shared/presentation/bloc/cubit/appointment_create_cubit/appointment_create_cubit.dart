import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import '../../../../../features/appointment/data/services/appointment_create_service.dart';
import 'appointment_create_state.dart';


class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentService _appointmentService=getIt<AppointmentService>();

  AppointmentCubit() : super(AppointmentInitial());

  Future<void> createAppointment({
    required int doctorId,
    required DateTime time,
    required int appointmentTypeId,

  }) async {
    emit(AppointmentLoading());
    try {
      final success = await _appointmentService.createAppointment(
        doctorId: doctorId,
        time: time,
        appointmentTypeId: appointmentTypeId,

      );

      if (success) {
        emit(AppointmentSuccess());
      } else {
        emit(AppointmentFailure('Failed to create appointment.'));
      }
    } catch (e) {
      emit(AppointmentFailure('An error occurred: $e'));
    }
  }
}