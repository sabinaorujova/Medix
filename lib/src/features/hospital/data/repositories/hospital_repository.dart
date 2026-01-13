import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/hospital_list_model.dart';


class HospitalRepository extends BaseRepository {
  HospitalRepository(super.dioClient);


  Future<Result<List<HospitalListModel>>> getHospitalList(
      String clinicId) async {
    try {
      final response = await get(EndPoints.hospitalListUrl(clinicId));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data.map((e) => HospitalListModel.fromJson(e)).toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load hospitals',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}