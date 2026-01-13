import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/features/auth/data/models/auth_response.dart';
import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';


class LoginService {
  Future<AuthResponse?> login(
      {required String email, required String password}) async {
    final Uri loginUri = Uri.parse(EndPoints.loginUrl);
    final body = {
      "email": email,
      "password": password,
    };
    final http.Response response = await http.post(loginUri, body: body);
    log('Cavab statusu: ${response.statusCode}');
    log('Cavab gövdəsi: ${response.body}');
    if (response.statusCode > 199 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
            log('Pars edilmiş data: $data');

      return AuthResponse.fromJson(data);
    } 
      return null;
  }
}
