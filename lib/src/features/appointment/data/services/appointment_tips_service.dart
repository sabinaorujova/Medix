import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'dart:convert';

import '../models/appointment_tips_model.dart';

class AppointmentTipsService {
  AppointmentTipsService();

 Future<List<AppointmentTips>> fetchAppointmentTypes(int doctorId) async {
  final response = await http.get(Uri.parse(EndPoints.appointmentTypeListUrl(doctorId)));
  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => AppointmentTips.fromJson(json)).toList();
  } else {
    print('Error: ${response.statusCode} - ${response.body}');
    throw Exception('Failed to load appointment types');
  }
}

}
