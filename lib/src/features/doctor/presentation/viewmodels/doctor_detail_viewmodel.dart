import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/doctor/data/repositories/doctor_detail_repository.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_detail_model.dart';
import 'doctor_detail_state.dart';


class DoctorDetailViewModel extends BaseViewModel<DoctorDetailState> {
  final DoctorDetailRepository _repository;

  DoctorDetailViewModel(this._repository) : super(const DoctorDetailInitial());

  DoctorDetailResponse? doctorDetail;


  Future<void> getDoctorDetail(int id) async {
    setState(const DoctorDetailLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getDoctorDetail(id);

    switch (result) {
      case Success(data: final data):
        doctorDetail = data;
        setState(DoctorDetailSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(DoctorDetailError(message));
        setError(message);
        setLoading(false);
    }
  }
}