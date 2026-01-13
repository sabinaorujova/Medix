import 'package:hive/hive.dart';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../../../../../features/patient/data/models/patient_get_model.dart';
import 'patient_list_create.dart';

class PatientCreateListCubit extends Cubit<PatientState> {
  PatientCreateListCubit() : super(PatientInitial());

  Future<void> fetchPatients() async {
    try {
      emit(PatientLoading());

      final Box<String> authBox = Hive.box<String>('authBox');
      final String? token = authBox.get('auth_token');

      if (token == null) {
        emit(PatientError('No authentication token found'));
        return;
      }


      print('Retrieved token from Hive: $token');

      final response = await http.get(
        Uri.parse('https://medix.pythonanywhere.com/patient/list'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final patients = data.map((json) => PatientGet.fromJson(json)).toList();
        emit(PatientLoaded(patients));
      } else {
        emit(PatientError('Failed to load patients'));
      }
    } on SocketException catch (_) {
      emit(PatientError('Network error'));
    } catch (e) {
      print('Error occurred: $e');
      emit(PatientError('An error occurred: $e'));
    }
  }
}