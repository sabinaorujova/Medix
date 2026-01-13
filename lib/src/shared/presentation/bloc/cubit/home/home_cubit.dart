
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_plate/src/features/home/data/services/home_service.dart';

import 'home_state.dart';

class DoctorsDetailsCubit extends Cubit<DoctorsDetailsState> {
  DoctorsDetailsCubit() : super(DoctorsDetailsInitial());

Stream<DocumentSnapshot<Map<String, dynamic>>> getDoctorDetails(String doctorId) =>
      DoctorDetailService.getDoctorDetailsById(doctorId);


  Stream<QuerySnapshot<Map<String, dynamic>>> getHomeServices() =>
      DoctorDetailService.getServices();

  Stream<QuerySnapshot<Map<String, dynamic>>> getPharmacyList() =>
      DoctorDetailService.getPharmacy();
}