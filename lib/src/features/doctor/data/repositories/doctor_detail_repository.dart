import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/doctor_detail_model.dart';


class DoctorDetailRepository extends BaseRepository {
  DoctorDetailRepository(super.dioClient);


  Future<Result<DoctorDetailResponse>> getDoctorDetail(int id) async {
    try {
      final response = await get('${EndPoints.doctorDetailUrl}/$id');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        return Success(DoctorDetailResponse.fromJson(data));
      } else {
        return Failure(
          'Failed to load doctor details',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}