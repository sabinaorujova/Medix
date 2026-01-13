import 'package:nutri_plate/src/features/doctor/data/models/doctor_list_model.dart';


sealed class DoctorListState {
  const DoctorListState();
}


class DoctorListInitial extends DoctorListState {
  const DoctorListInitial();
}


class DoctorListLoading extends DoctorListState {
  const DoctorListLoading();
}


class DoctorListSuccess extends DoctorListState {
  final List<DoctorListModel> doctors;
  const DoctorListSuccess(this.doctors);
}


class DoctorListError extends DoctorListState {
  final String message;
  const DoctorListError(this.message);
}