import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/hospital_filter_model.dart';


class HospitalFilterRepository extends BaseRepository {
  HospitalFilterRepository(super.dioClient);


  Future<Result<List<FilterModel>>> getFilteredHospitals({
    String? cityId,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (cityId != null && cityId.isNotEmpty) {
        queryParams['city'] = cityId;
      }
      if (minPrice != null) {
        queryParams['min_price'] = minPrice;
      }
      if (maxPrice != null) {
        queryParams['max_price'] = maxPrice;
      }

      final response = await get(
        EndPoints.hospitalFilterListUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => FilterModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load filtered hospitals',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}