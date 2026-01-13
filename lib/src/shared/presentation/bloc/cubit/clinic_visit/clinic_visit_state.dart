
sealed class ClinicVisitState {}

final class ClinicVisitInitial extends ClinicVisitState {}

final class ClinicVisitLoading extends ClinicVisitState {}

final class ClinicVisitSuccess extends ClinicVisitState {

}

final class ClinicVisitError extends ClinicVisitState {}