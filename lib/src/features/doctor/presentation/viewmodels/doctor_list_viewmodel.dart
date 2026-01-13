import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/doctor/data/repositories/doctor_repository.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_list_model.dart';
import 'doctor_list_state.dart';


class DoctorListViewModel extends BaseViewModel<DoctorListState> {
  final DoctorRepository _repository;

  DoctorListViewModel(this._repository) : super(const DoctorListInitial());

  List<DoctorListModel>? doctors;


  Future<void> getDoctors(String hospitalId) async {
    setState(const DoctorListLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getDoctorList(hospitalId);

    switch (result) {
      case Success(data: final data):
        doctors = data;
        setState(DoctorListSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(DoctorListError(message));
        setError(message);
        setLoading(false);
    }
  }
}