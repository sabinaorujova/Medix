import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/hospital_city_list_model.dart';


class HospitalCityRepository extends BaseRepository {
  HospitalCityRepository(super.dioClient);


  Future<Result<List<HospitalCityListModel>>> getHospitalCities() async {
    try {
      final response = await get(EndPoints.hospitalCityListUrl);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => HospitalCityListModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load hospital cities',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}