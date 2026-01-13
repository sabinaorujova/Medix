import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import '../models/hospital_search_model.dart';


class HospitalSearchRepository extends BaseRepository {
  HospitalSearchRepository(super.dioClient);


  Future<Result<List<HospitalSearchModel>>> searchHospitals(String query) async {
    try {
      final response = await get('/hospital/search/$query');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => HospitalSearchModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to search hospitals',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}