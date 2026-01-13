import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nutri_plate/src/features/auth/data/models/auth_response.dart';

import 'package:nutri_plate/src/core/utils/constants/endpoints.dart';

class RegisterService {
  Future<AuthResponse?> register(
      {required String username,
      required String email,required String phone,
      required String password}) async {
    final Uri url = Uri.parse(EndPoints.registerUrl);
    final body = {"full_name": username, "email": email, "password": password,"phone":phone};
    final http.Response response = await http.post(url, body: body);
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
