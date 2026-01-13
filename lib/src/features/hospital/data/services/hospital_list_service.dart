import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/hospital_list_model.dart';

class HospitalListService {
  Future<List<HospitalListModel>> getHospitalList(String clinicId) async {
   final Uri uri = Uri.parse(EndPoints.hospitalListUrl(clinicId));


    log('Fetching hospital list for clinicId: $clinicId');
    log('Request URL: $uri');

    final response = await http.get(uri);

    log('Response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      log('Response body: ${response.body}');
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => HospitalListModel.fromJson(data)).toList();
    } else {
      log('Failed to load hospital list, status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      throw Exception('Failed to load hospital list');
    }
  }
}
