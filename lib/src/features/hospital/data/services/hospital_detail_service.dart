import 'dart:convert';

import 'package:http/http.dart';

import '../models/hospital_detail_model.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';

class HospitalDetailService {

  Future<HospitalDetailModel> getProductDetail( int id) async {
    final Uri uri = Uri.parse('${EndPoints.hospitalDetailUrl}/$id');
    final Response response = await get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final HospitalDetailModel productDetail =
          HospitalDetailModel.fromJson(data);

      return productDetail;
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
