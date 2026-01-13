import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/features/doctor/data/models/doctor_list_model.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
class DoctorListService {
  Future<List<DoctorListModel>> getDoctorsList(String doctorId) async {
    final Uri uri = Uri.parse(EndPoints.doctorListUrl('$doctorId'));

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        log('Response status code: ${response.statusCode}');
        log('Response body: ${response.body}');
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => DoctorListModel.fromJson(data)).toList();
      } else {
        log('Failed to load doctor list, status code: ${response.statusCode}');
        log('Response body: ${response.body}');
        throw Exception('Failed to load doctor list');
      } 
    } catch (e) {
      log('Error during HTTP request: $e');
      throw Exception('Failed to load doctor list');
    }
  }
}
