import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import '../models/clinic_search_model.dart';


class ClinicSearchRepository extends BaseRepository {
  ClinicSearchRepository(super.dioClient);


  Future<Result<List<ClinicSearchModel>>> searchClinics(String query) async {
    try {
      final response = await get('/clinic/search/$query');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => ClinicSearchModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to search clinics',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}