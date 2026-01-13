import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/blood_list_model.dart';

class BloodService {
  final String _baseUrl = 'https://medix.pythonanywhere.com';

  Future<List<BloodListModel>> getBloodList() async {
    final response = await http.get(Uri.parse('$_baseUrl/patient/blood/list'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => BloodListModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load gender list');
    }
  }
}
