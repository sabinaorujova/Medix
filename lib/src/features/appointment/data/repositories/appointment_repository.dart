import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import '../models/appointment_tips_model.dart';
import '../models/confirm_appointment_model.dart';


class AppointmentRepository extends BaseRepository {
  AppointmentRepository(super.dioClient);


  Future<Result<bool>> createAppointment({
    required int doctorId,
    required DateTime time,
    required int appointmentTypeId,
    int? patientId,
  }) async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final formattedTime = DateFormat('yyyy-MM-dd').format(time);

      final response = await post(
        '${EndPoints.baseUrl}/appointment/create',
        data: jsonEncode({
          'doctor': doctorId,
          'time': formattedTime,
          'apointment_type': appointmentTypeId,
          if (patientId != null) 'patient': patientId,
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Success(true);
      } else {
        return Failure(
          'Failed to create appointment',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<List<AppointmentTips>>> getAppointmentTypes(int doctorId) async {
    try {
      final response = await get(EndPoints.appointmentTypeListUrl(doctorId));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => AppointmentTips.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load appointment types',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<List<ConfirmAppointmentModel>>> getAppointments() async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final response = await get(
        '${EndPoints.baseUrl}/appointment/list',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data
            .map((e) => ConfirmAppointmentModel.fromJson(e))
            .toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load appointments',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}