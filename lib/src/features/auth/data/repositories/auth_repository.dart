import 'dart:convert';
import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';
import '../models/auth_response.dart';



class AuthRepository extends BaseRepository {
  AuthRepository(super.dioClient);


  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = {
        "email": email,
        "password": password,
      };

      final response = await post(
        EndPoints.loginUrl,
        data: body,
      );

      if (response.statusCode != null &&
          response.statusCode! > 199 &&
          response.statusCode! < 300) {
        final data = jsonDecode(response.data);
        return Success(AuthResponse.fromJson(data));
      } else {
        return Failure(
          'Login failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<AuthResponse>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final body = {
        "full_name": username,
        "email": email,
        "password": password,
        "phone": phone,
      };

      final response = await post(
        EndPoints.registerUrl,
        data: body,
      );

      if (response.statusCode != null &&
          response.statusCode! > 199 &&
          response.statusCode! < 300) {
        final responseData = jsonDecode(response.data);
        return Success(AuthResponse.fromJson(responseData));
      } else {
        return Failure(
          'Registration failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}