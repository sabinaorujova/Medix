import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../../../features/clinic_visit/data/services/clinic_search_service.dart';
import 'clinic_search_state.dart';

class ClinicSearchCubit extends Cubit<ClinicSearchState> {
  final ClinicSearchService _clinicSearchService;

  ClinicSearchCubit(this._clinicSearchService) : super(ClinicSearchInitial());

  Future<void> searchClinics(String query) async {
    emit(ClinicSearchLoading());

    try {
      final clinics = await _clinicSearchService.searchClinics(query);
      emit(ClinicSearchLoaded(clinics));
    } catch (e) {
        log('Failed to load search results: $e');

     emit(ClinicSearchError('Failed to load search results: $e'));

    }
  }
}