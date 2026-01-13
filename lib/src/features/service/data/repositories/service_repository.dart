import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/service_model.dart';


class ServiceRepository extends BaseRepository {
  ServiceRepository(super.dioClient);


  Future<Result<List<ServiceModel>>> getServices() async {
    try {
      final response = await get('${EndPoints.baseUrl}/service/list');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => ServiceModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load services',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<ServiceModel>> getServiceDetail(int id) async {
    try {
      final response = await get('${EndPoints.baseUrl}/service/detail/$id');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        return Success(ServiceModel.fromJson(data));
      } else {
        return Failure(
          'Failed to load service details',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}