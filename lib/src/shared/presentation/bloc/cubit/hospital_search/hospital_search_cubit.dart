import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_search_service.dart';

import 'hospital_search_state.dart';

class HospitalSearchCubit extends Cubit<HospitalSearchState> {
  final HospitalSearchService  _hospitalSearchService= getIt<HospitalSearchService>();

  HospitalSearchCubit() : super(HospitalSearchInitial());

  Future<void> searchHospitals(String query) async {
    emit(HospitalSearchLoading());

    try {
      final hospitals = await _hospitalSearchService.searchHospitals(query);
       emit(HospitalSearchLoaded(hospitals));
    } catch (e) {
        log('Failed to load search results: $e');

     emit(HospitalSearchError('Failed to load search results: $e'));

    }
  }
}