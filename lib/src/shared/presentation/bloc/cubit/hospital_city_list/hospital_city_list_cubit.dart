import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_city_list_model.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_city_list_service.dart';

import '../../../../../core/helper/extensions/service_locator.dart';

part 'hospital_city_list_state.dart';

class HospitalCityListCubit extends Cubit<HospitalCityListState> {
  HospitalCityListCubit() : super(HospitalCityListInitial());

  late final HospitalCityListService _hospitalCityListService =
      getIt.get<HospitalCityListService>();

  List<HospitalCityListModel>? cities;

  Future<void> getHospitalCityList() async {
    try {
      emit(HospitalCityListLoading());

      final fetchedCities =
          await _hospitalCityListService.getHospitalCityList();

      cities = fetchedCities;

      emit(HospitalCityListSuccess());
    } catch (e) {
      print('Error: $e');
      emit(HospitalCityListError());
    }
  }
}