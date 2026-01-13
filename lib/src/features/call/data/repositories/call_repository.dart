import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import '../models/call_model.dart';


class CallRepository extends BaseRepository {
  CallRepository(super.dioClient);


  Future<Result<CallModel>> startCall(int appointmentId) async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final response = await post(
        '${EndPoints.baseUrl}/call/start',
        data: jsonEncode({
          'appointment_id': appointmentId,
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.data);
        return Success(CallModel.fromJson(data));
      } else {
        return Failure(
          'Failed to start call',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<bool>> endCall(String callId) async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final response = await post(
        '${EndPoints.baseUrl}/call/end',
        data: jsonEncode({
          'call_id': callId,
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
          'Failed to end call',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}