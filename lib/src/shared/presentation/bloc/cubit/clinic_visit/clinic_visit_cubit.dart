
import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/models/clinic_visit_model.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/services/clinic_visit_service.dart';

import '../../../../../core/helper/extensions/service_locator.dart';
import 'clinic_visit_state.dart';

class ClinicVisitCubit extends Cubit<ClinicVisitState> {
  ClinicVisitCubit() : super(ClinicVisitInitial());

  late final ClinicVisitService _clinicVisitService =
      getIt.get<ClinicVisitService>();

  List<ClinicVisitResponse>? clinics;

  Future<void> getClinic() async {
    print('getClinic called');
    try {
      print('111111111111122');
      emit(ClinicVisitLoading());
      print('ClinicVisitLoading emitted');

      final fetchedClinic = await _clinicVisitService.getClinicVisit();
      print('Fetched clinics: $fetchedClinic');

      clinics = fetchedClinic;

      emit(ClinicVisitSuccess());
      print('ClinicVisitSuccess emitted');
    } catch (e) {
      print('Error: $e');
      emit(ClinicVisitError());
    }
  }
}