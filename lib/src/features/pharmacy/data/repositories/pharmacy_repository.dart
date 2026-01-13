import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/pharmacy_model.dart';


class PharmacyRepository extends BaseRepository {
  PharmacyRepository(super.dioClient);


  Future<Result<List<PharmacyModel>>> getPharmacies() async {
    try {
      final response = await get('${EndPoints.baseUrl}/pharmacy/list');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => PharmacyModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load pharmacies',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<PharmacyModel>> getPharmacyDetail(int id) async {
    try {
      final response = await get('${EndPoints.baseUrl}/pharmacy/detail/$id');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        return Success(PharmacyModel.fromJson(data));
      } else {
        return Failure(
          'Failed to load pharmacy details',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}