import 'package:nutri_plate/src/features/hospital/data/models/hospital_list_model.dart';


sealed class HospitalListState {
  const HospitalListState();
}


class HospitalListInitial extends HospitalListState {
  const HospitalListInitial();
}


class HospitalListLoading extends HospitalListState {
  const HospitalListLoading();
}


class HospitalListSuccess extends HospitalListState {
  final List<HospitalListModel> hospitals;
  const HospitalListSuccess(this.hospitals);
}


class HospitalListError extends HospitalListState {
  final String message;
  const HospitalListError(this.message);
}