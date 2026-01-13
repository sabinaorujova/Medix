import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/doctor_list_model.dart';


class DoctorRepository extends BaseRepository {
  DoctorRepository(super.dioClient);


  Future<Result<List<DoctorListModel>>> getDoctorList(String hospitalId) async {
    try {
      final response = await get(EndPoints.doctorListUrl(hospitalId));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => DoctorListModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load doctors',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}