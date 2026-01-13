import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_list_model.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_list_service.dart';
import '../../../../../core/helper/extensions/service_locator.dart';
import 'hospital_list_state.dart';

class HospitalListCubit extends Cubit<HospitalListState> {
  HospitalListCubit() : super(HospitalListInitial());

  late final HospitalListService _hospitalListService = getIt.get<HospitalListService>();

  List<HospitalListModel>? hospitals;

  Future<void> getHospitals(String clinicId) async {
    print('getHospitals called');
    emit(HospitalListLoading());
    print('HospitalListLoading emitted');

    try {
      final fetchedHospital = await _hospitalListService.getHospitalList(clinicId);
      print('Fetched hospitals: $fetchedHospital');

      hospitals = fetchedHospital;

      emit(HospitalListSuccess());
      print('HospitalListSuccess emitted');
    } catch (e) {
      print('Error: $e');
      emit(HospitalListError());
    }
  }
}