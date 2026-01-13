import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AppointmentService {
  final String baseUrl = 'https://medix.pythonanywhere.com/';

  Future<bool> createAppointment({
    required int doctorId,
    required DateTime time,
    required int appointmentTypeId,

  }) async {
    final Box<String> authBox = Hive.box<String>('authBox');
    final String? token = authBox.get('auth_token');

    print('Auth Token: $token');


    final String formattedTime = DateFormat('yyyy-MM-dd').format(time);

    final response = await http.post(
      Uri.parse('$baseUrl/appointment/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'doctor': doctorId,
        'time': formattedTime,
        'apointment_type': appointmentTypeId,

      }
      ),

    );


    print('Status Code: ${response.statusCode}');


    print('Response Body: ${response.body}');

    return response.statusCode == 200;
  }
}
