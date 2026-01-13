import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/features/appointment/data/models/confirm_appointment_model.dart';
class AppointmentConfirmService {
  final String baseUrl = 'https://medix.pythonanywhere.com';

  Future<List<ConfirmAppointmentModel>> fetchAppointments() async {
    final Box<String> authBox = Hive.box<String>('authBox');
    final String? token = authBox.get('auth_token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(Uri.parse('$baseUrl/appointment/list'), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ConfirmAppointmentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load appointments: ${response.statusCode}');
    }
  }
}
