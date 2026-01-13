import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_detail_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_detail_model.dart';
import 'hospital_detail_state.dart';


class HospitalDetailViewModel extends BaseViewModel<HospitalDetailState> {
  final HospitalDetailRepository _repository;

  HospitalDetailViewModel(this._repository) : super(const HospitalDetailInitial());

  HospitalDetailModel? hospitalDetail;


  Future<void> getHospitalDetail(int id) async {
    setState(const HospitalDetailLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getHospitalDetail(id);

    switch (result) {
      case Success(data: final data):
        hospitalDetail = data;
        setState(HospitalDetailSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(HospitalDetailError(message));
        setError(message);
        setLoading(false);
    }
  }
}