import 'dart:io';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';


class PatientRepository extends BaseRepository {
  PatientRepository(super.dioClient);


  Future<Result<bool>> createPatient(Map<String, dynamic> patientData) async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final formData = FormData.fromMap({
        'first_name': patientData['first_name'],
        'last_name': patientData['last_name'],
        'birthday': patientData['birthday'],
        'phone': patientData['phone'],
        'gender': patientData['gender'] ?? '',
        'blood': patientData['blood'] ?? '',
      });


      if (patientData['profile_photo'] != null && patientData['profile_photo'] is File) {
        formData.files.add(MapEntry(
          'profile_photo',
          await MultipartFile.fromFile(
            (patientData['profile_photo'] as File).path,
          ),
        ));
      }

      final response = await post(
        EndPoints.patientCreate,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        return Success(true);
      } else {
        return Failure(
          'Failed to create patient',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}