import 'package:nutri_plate/src/features/hospital/data/models/hospital_search_model.dart';

abstract class HospitalSearchState {}

class HospitalSearchInitial extends HospitalSearchState {}

class HospitalSearchLoading extends HospitalSearchState {}

class HospitalSearchLoaded extends HospitalSearchState {
  final List<HospitalSearchModel> hospitals;

  HospitalSearchLoaded(this.hospitals);
}

class HospitalSearchError extends HospitalSearchState {
  final String message;

  HospitalSearchError(this.message);
}