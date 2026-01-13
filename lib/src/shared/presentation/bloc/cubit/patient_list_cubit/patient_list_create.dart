
import '../../../../../features/patient/data/models/patient_get_model.dart';

abstract class PatientState {}

class PatientInitial extends PatientState {}

class PatientLoading extends PatientState {}

class PatientLoaded extends PatientState {
  final List<PatientGet> patients;

  PatientLoaded(this.patients);
}

class PatientError extends PatientState {
  final String message;

  PatientError(this.message);
}