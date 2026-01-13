
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart'; 
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'dart:io';

class PatientService {
  Future<bool> createPatient(Map<String, dynamic> patientData) async {
    final Box<String> authBox = Hive.box<String>('authBox');
    final String? token = authBox.get('auth_token');

    if (token == null) {
      print('No authentication token found.');
      return false; 
    }


    var request = http.MultipartRequest(
      'POST',
      Uri.parse(EndPoints.patientCreate),
    );

    request.headers['Authorization'] = 'Bearer $token';


    request.fields['first_name'] = patientData['first_name'];
    request.fields['last_name'] = patientData['last_name'];
    request.fields['birthday'] = patientData['birthday'];
    request.fields['phone'] = patientData['phone'];
    request.fields['gender'] = patientData['gender'] ?? '';
    request.fields['blood'] = patientData['blood'] ?? '';


    if (patientData['profile_photo'] != null && patientData['profile_photo'] is File) {
      var photo = await http.MultipartFile.fromPath(
        'profile_photo',
        (patientData['profile_photo'] as File).path,
      );
      request.files.add(photo);
    }


    var response = await request.send();

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to create patient: ${response.statusCode}');
      return false; 
    }
  }
}
