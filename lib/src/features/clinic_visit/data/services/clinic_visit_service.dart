import 'dart:convert';
import 'package:http/http.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/clinic_visit_model.dart';


class ClinicVisitService {
  Future<List<ClinicVisitResponse>> getClinicVisit() async {
    final Uri url = Uri.parse(EndPoints.clinicListUrl);
    final Response response = await get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final result = data.map((e) => ClinicVisitResponse.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load clinics');
    }
  }
}
