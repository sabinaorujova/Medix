

import 'package:nutri_plate/src/features/hospital/data/models/hospital_filter_model.dart';

abstract class HospitalFilterState {}

class HospitalFilterInitial extends HospitalFilterState {}

class HospitalFilterLoading extends HospitalFilterState {}

class HospitalFilterSuccess extends HospitalFilterState {
  final List<FilterModel> filteredHospitals;

  HospitalFilterSuccess(this.filteredHospitals);
}

class HospitalFilterFailure extends HospitalFilterState {
  final String error;

  HospitalFilterFailure(this.error);
}