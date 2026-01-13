import 'package:nutri_plate/src/core/base/base_view_model.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/features/patient/data/repositories/patient_repository.dart';
import 'patient_state.dart';


class PatientViewModel extends BaseViewModel<PatientState> {
  final PatientRepository _repository;

  PatientViewModel(this._repository) : super(const PatientInitial());


  Future<void> createPatient(Map<String, dynamic> patientData) async {
    setState(const PatientLoading());
    setLoading(true);
    clearError();

    final result = await _repository.createPatient(patientData);

    switch (result) {
      case Success():
        setState(const PatientSuccess());
        setLoading(false);
      case Failure(message: final message, statusCode: _):
        setState(PatientError(message));
        setError(message);
        setLoading(false);
    }
  }
}