import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/appointment/data/repositories/appointment_repository.dart';
import 'package:nutri_plate/src/features/appointment/data/models/appointment_tips_model.dart';
import 'package:nutri_plate/src/features/appointment/data/models/confirm_appointment_model.dart';
import 'appointment_state.dart';


class AppointmentViewModel extends BaseViewModel<AppointmentState> {
  final AppointmentRepository _repository;

  AppointmentViewModel(this._repository) : super(const AppointmentInitial());

  List<AppointmentTips>? appointmentTypes;
  List<ConfirmAppointmentModel>? appointments;


  Future<void> createAppointment({
    required int doctorId,
    required DateTime time,
    required int appointmentTypeId,
    int? patientId,
  }) async {
    setState(const AppointmentLoading());
    setLoading(true);
    clearError();

    final result = await _repository.createAppointment(
      doctorId: doctorId,
      time: time,
      appointmentTypeId: appointmentTypeId,
      patientId: patientId,
    );

    switch (result) {
      case Success():
        setState(const AppointmentSuccess());
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(AppointmentError(message));
        setError(message);
        setLoading(false);
    }
  }


  Future<void> getAppointmentTypes(int doctorId) async {
    setState(const AppointmentLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getAppointmentTypes(doctorId);

    switch (result) {
      case Success(data: final data):
        appointmentTypes = data;
        setState(AppointmentTypesLoaded(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(AppointmentError(message));
        setError(message);
        setLoading(false);
    }
  }


  Future<void> getAppointments() async {
    setState(const AppointmentLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getAppointments();

    switch (result) {
      case Success(data: final data):
        appointments = data;
        setState(AppointmentsLoaded(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(AppointmentError(message));
        setError(message);
        setLoading(false);
    }
  }
}