import 'package:nutri_plate/src/features/hospital/data/models/hospital_detail_model.dart';


sealed class HospitalDetailState {
  const HospitalDetailState();
}


class HospitalDetailInitial extends HospitalDetailState {
  const HospitalDetailInitial();
}


class HospitalDetailLoading extends HospitalDetailState {
  const HospitalDetailLoading();
}


class HospitalDetailSuccess extends HospitalDetailState {
  final HospitalDetailModel hospitalDetail;
  const HospitalDetailSuccess(this.hospitalDetail);
}


class HospitalDetailError extends HospitalDetailState {
  final String message;
  const HospitalDetailError(this.message);
}