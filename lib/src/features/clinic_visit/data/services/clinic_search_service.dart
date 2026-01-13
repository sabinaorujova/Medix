import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/clinic_search_model.dart';

class ClinicSearchService {
  Future<List<ClinicSearchModel>> searchClinics(String query) async {
    final url = Uri.parse(
        'https://medix.pythonanywhere.com/clinic/search/$query');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        log('Search results loaded successfully');
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => ClinicSearchModel.fromJson(json)).toList();
      } else {
        log('Failed to load search results. Status code: ${response.statusCode}');
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      log('Failed to load search results: $e');
      throw Exception('Failed to load search results');
    }
  }
}
