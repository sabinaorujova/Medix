import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/repositories/clinic_visit_repository.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/models/clinic_visit_model.dart';
import 'clinic_visit_state.dart';


class ClinicVisitViewModel extends BaseViewModel<ClinicVisitState> {
  final ClinicVisitRepository _repository;

  ClinicVisitViewModel(this._repository) : super(const ClinicVisitInitial());

  List<ClinicVisitResponse>? clinics;


  Future<void> getClinic() async {
    setState(const ClinicVisitLoading());
    setLoading(true);
    clearError();

    final result = await _repository.getClinicVisit();

    switch (result) {
      case Success(data: final data):
        clinics = data;
        setState(ClinicVisitSuccess(data));
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(ClinicVisitError(message));
        setError(message);
        setLoading(false);
    }
  }
}