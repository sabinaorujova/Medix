import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/hospital_detail_model.dart';


class HospitalDetailRepository extends BaseRepository {
  HospitalDetailRepository(super.dioClient);


  Future<Result<HospitalDetailModel>> getHospitalDetail(int id) async {
    try {
      final response = await get('${EndPoints.hospitalDetailUrl}/$id');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        return Success(HospitalDetailModel.fromJson(data));
      } else {
        return Failure(
          'Failed to load hospital details',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}