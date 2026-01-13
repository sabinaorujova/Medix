import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/gender_list_model.dart';

class GenderService {
  final String _baseUrl = 'https://medix.pythonanywhere.com';

  Future<List<GenderListModel>> getGenderList() async {
    final response = await http.get(Uri.parse('$_baseUrl/patient/gender/list'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => GenderListModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load gender list');
    }
  }
}
