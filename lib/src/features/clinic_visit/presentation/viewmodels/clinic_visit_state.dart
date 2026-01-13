
sealed class ClinicVisitState {
  const ClinicVisitState();
}


class ClinicVisitInitial extends ClinicVisitState {
  const ClinicVisitInitial();
}


class ClinicVisitLoading extends ClinicVisitState {
  const ClinicVisitLoading();
}


class ClinicVisitSuccess extends ClinicVisitState {
  final List<dynamic> clinics;
  const ClinicVisitSuccess(this.clinics);
}


class ClinicVisitError extends ClinicVisitState {
  final String message;
  const ClinicVisitError(this.message);
}