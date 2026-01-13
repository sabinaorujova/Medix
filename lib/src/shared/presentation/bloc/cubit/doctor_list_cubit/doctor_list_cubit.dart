import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_list_model.dart';
import 'package:nutri_plate/src/features/doctor/data/services/doctor_list_service.dart';
import 'dart:developer';

import '../../../../../core/helper/extensions/service_locator.dart';
import 'doctor_list_state.dart';


class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit() : super(DoctorListInitial());

  late final DoctorListService _doctorListService = getIt.get<DoctorListService>();

  List<DoctorListModel>? doctors;

  Future<void> getDoctors(String doctorId) async {
    log('getDoctors called with doctorId: $doctorId');
    emit(DoctorListInitial());
    log('DoctorListInitial emitted');

    try {
      final fetchedDoctors = await _doctorListService.getDoctorsList(doctorId);
      log('Fetched doctors: $fetchedDoctors');

      doctors = fetchedDoctors;

      emit(DoctorListSuccess());
      log('DoctorListSuccess emitted');
    } catch (e) {
      log('Error: $e');
      emit(DoctorListError());
    }
  }
}