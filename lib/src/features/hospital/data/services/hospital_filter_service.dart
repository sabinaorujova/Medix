import 'dart:convert';

import 'package:http/http.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_filter_model.dart';

import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';

class HospitalFilterService {
  Future<List<FilterModel>> getHospitalFilter() async {
    final Uri url = Uri.parse(EndPoints.hospitalFilterListUrl);
    final Response response = await get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final result =
          data.map((e) => FilterModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load filter');
    }
  }
}
