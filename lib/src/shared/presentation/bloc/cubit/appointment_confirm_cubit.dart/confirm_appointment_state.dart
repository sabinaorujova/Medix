import 'package:nutri_plate/src/features/appointment/data/models/confirm_appointment_model.dart';

class ConfirmAppointmentState {}

class  ConfirmAppointmentInitial extends ConfirmAppointmentState {}

class ConfirmAppointmentLoading extends ConfirmAppointmentState {}

class ConfirmAppointmentLoaded extends ConfirmAppointmentState {
  final List<ConfirmAppointmentModel> appointments;

  ConfirmAppointmentLoaded(this.appointments);
}

class ConfirmAppointmentError extends ConfirmAppointmentState {
  final String message;

  ConfirmAppointmentError(this.message);
}