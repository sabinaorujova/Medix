import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_list_model.dart';
import 'hospital_list_state.dart';


class HospitalListViewModel extends BaseViewModel<HospitalListState> {
  final HospitalRepository _repository;

  HospitalListViewModel(this._repository) : super(const HospitalListInitial());

  List<HospitalListModel>? hospitals;


  Future<void> getHospitals(String clinicId) async {
    setState(const HospitalListLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getHospitalList(clinicId);

    switch (result) {
      case Success(data: final data):
        hospitals = data;
        setState(HospitalListSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(HospitalListError(message));
        setError(message);
        setLoading(false);
    }
  }
}