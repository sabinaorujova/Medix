import 'dart:convert';

import 'package:http/http.dart';
import 'package:nutri_plate/src/features/hospital/data/models/hospital_city_list_model.dart';

import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';

class HospitalCityListService {
  Future<List<HospitalCityListModel>> getHospitalCityList() async {
    final Uri url = Uri.parse(EndPoints.hospitalCityListUrl);
    final Response response = await get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final result =
          data.map((e) => HospitalCityListModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load city');
    }
  }
}
