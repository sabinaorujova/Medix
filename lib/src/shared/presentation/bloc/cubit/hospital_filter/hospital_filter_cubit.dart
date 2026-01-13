import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_filter_model.dart';

import '../../../../../core/helper/extensions/service_locator.dart';
import '../../../../../features/hospital/data/services/hospital_filter_service.dart';
import 'hospital_filter_state.dart';


class HospitalFilterCubit extends Cubit<HospitalFilterState> {
  HospitalFilterCubit() : super(HospitalFilterInitial());


  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
 late final HospitalFilterService _hospitalFilterService = getIt.get<HospitalFilterService>();

  List<FilterModel>? filters;

  Future<void> getFilters(String city, int minPrice, int maxPrice) async {
    try {
    emit(HospitalFilterLoading());

      final hospitals = await _hospitalFilterService.getHospitalFilter();

       final filteredHospitals = hospitals.where((hospital) {
        final matchesCity = hospital.address == city;
        final withinPriceRange = hospital.price! >= minPrice && hospital.price! <= maxPrice;
        return matchesCity && withinPriceRange;
      }).toList();
      emit(HospitalFilterSuccess(filteredHospitals));

      emit(HospitalFilterSuccess( filteredHospitals));
    } catch (e) {
      print('Error: $e');
      emit(HospitalFilterFailure(e.toString()));
    }
  }


}