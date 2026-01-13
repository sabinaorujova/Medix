import 'package:nutri_plate/src/features/doctor/data/models/doctor_detail_model.dart';


sealed class DoctorDetailState {
  const DoctorDetailState();
}


class DoctorDetailInitial extends DoctorDetailState {
  const DoctorDetailInitial();
}


class DoctorDetailLoading extends DoctorDetailState {
  const DoctorDetailLoading();
}


class DoctorDetailSuccess extends DoctorDetailState {
  final DoctorDetailResponse doctorDetail;
  const DoctorDetailSuccess(this.doctorDetail);
}


class DoctorDetailError extends DoctorDetailState {
  final String message;
  const DoctorDetailError(this.message);
}