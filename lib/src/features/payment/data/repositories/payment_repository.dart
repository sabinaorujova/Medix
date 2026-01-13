import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/payment_method_model.dart';


class PaymentRepository extends BaseRepository {
  PaymentRepository(super.dioClient);


  Future<Result<List<PaymentMethodModel>>> getPaymentMethods() async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final response = await get(
        '${EndPoints.baseUrl}/payment/methods',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.data);
        final result = data.map((e) => PaymentMethodModel.fromJson(e)).toList();
        return Success(result);
      } else {
        return Failure(
          'Failed to load payment methods',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<bool>> createPayment({
    required int appointmentId,
    required int paymentMethodId,
    required double amount,
  }) async {
    try {
      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        return Failure('No authentication token found');
      }

      final response = await post(
        '${EndPoints.baseUrl}/payment/create',
        data: jsonEncode({
          'appointment_id': appointmentId,
          'payment_method_id': paymentMethodId,
          'amount': amount,
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        return Failure(
          'Failed to create payment',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}