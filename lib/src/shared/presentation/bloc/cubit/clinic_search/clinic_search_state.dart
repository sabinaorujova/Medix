
import '../../../../../features/clinic_visit/data/models/clinic_search_model.dart';

abstract class ClinicSearchState {}

class ClinicSearchInitial extends ClinicSearchState {}

class ClinicSearchLoading extends ClinicSearchState {}

class ClinicSearchLoaded extends ClinicSearchState {
  final List<ClinicSearchModel> clinics;

  ClinicSearchLoaded(this.clinics);
}

class ClinicSearchError extends ClinicSearchState {
  final String message;

  ClinicSearchError(this.message);
}