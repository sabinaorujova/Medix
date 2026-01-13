import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_detail_model.dart';

import '../../../../../core/helper/extensions/service_locator.dart';
import '../../../../../features/doctor/data/services/doctor_detail_service.dart';

part 'doctor_detail_state.dart';

class DoctorDetailCubit extends Cubit<DoctorDetailState> {
  DoctorDetailCubit() : super(DoctorDetailInitial());
  late final DoctorDetailService _doctorDetailService = getIt.get<DoctorDetailService>();

  DoctorDetailResponse? doctorDetails;
  Future<void> getDetail(int id) async {
    try {
      emit(DoctorDetailLoading());

      final fetchedDoctorDetail = await _doctorDetailService.getDoctorDetail(id);

      doctorDetails = fetchedDoctorDetail;

      emit(DoctorDetailSuccess());
    } catch (_) {
      emit(DoctorDetailError());
    }
  }

  void getDoctorDetails(int doctorId) {}
}