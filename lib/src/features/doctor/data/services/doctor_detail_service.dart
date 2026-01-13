import 'dart:convert';

import 'package:http/http.dart';
import 'package:nutri_plate/src/features/doctor/data/models/doctor_detail_model.dart';

import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';

class DoctorDetailService{

  Future<DoctorDetailResponse> getDoctorDetail( int id) async {
    final Uri uri = Uri.parse('${EndPoints.doctorDetailUrl}/$id');
    final Response response = await get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final DoctorDetailResponse productDetail =
          DoctorDetailResponse.fromJson(data);

      return productDetail;
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
