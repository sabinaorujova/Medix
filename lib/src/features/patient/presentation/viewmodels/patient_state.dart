
sealed class PatientState {
  const PatientState();
}


class PatientInitial extends PatientState {
  const PatientInitial();
}


class PatientLoading extends PatientState {
  const PatientLoading();
}


class PatientSuccess extends PatientState {
  const PatientSuccess();
}


class PatientError extends PatientState {
  final String message;
  const PatientError(this.message);
}