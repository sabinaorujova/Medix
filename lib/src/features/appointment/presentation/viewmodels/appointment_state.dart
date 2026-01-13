import 'package:nutri_plate/src/features/appointment/data/models/appointment_tips_model.dart';
import 'package:nutri_plate/src/features/appointment/data/models/confirm_appointment_model.dart';


sealed class AppointmentState {
  const AppointmentState();
}


class AppointmentInitial extends AppointmentState {
  const AppointmentInitial();
}


class AppointmentLoading extends AppointmentState {
  const AppointmentLoading();
}


class AppointmentSuccess extends AppointmentState {
  const AppointmentSuccess();
}


class AppointmentTypesLoaded extends AppointmentState {
  final List<AppointmentTips> appointmentTypes;
  const AppointmentTypesLoaded(this.appointmentTypes);
}


class AppointmentsLoaded extends AppointmentState {
  final List<ConfirmAppointmentModel> appointments;
  const AppointmentsLoaded(this.appointments);
}


class AppointmentError extends AppointmentState {
  final String message;
  const AppointmentError(this.message);
}