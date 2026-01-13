import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/clinic_visit_model.dart';



class ClinicVisitRepository extends BaseRepository {
  ClinicVisitRepository(super.dioClient);


  Future<Result<List<ClinicVisitResponse>>> getClinicVisit() async {
    try {
      final response = await get(EndPoints.clinicListUrl);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result =
            data.map((e) => ClinicVisitResponse.fromJson(e)).toList();
        return Success(result);
      } else {
        return Failure('Failed to load clinics',
            statusCode: response.statusCode);
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}