
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_plate/src/core/helper/extensions/service_locator.dart';
import 'dart:io';

import '../../../../../features/patient/data/services/patient_create_service.dart';
import 'patient_create_state.dart';

class PatientCubit extends Cubit<PatientCreateState> {
  final PatientService _patientService = getIt.get<PatientService>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDayController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  File? profilePhoto;

  String? selectedGender; 
  String? selectedBlood;
  PatientCubit() : super(PatientCreateInitial());
void createPatient() async {
  final birthdayString = birthDayController.text;


  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(birthdayString)) {
    emit(PatientCreateError('Date has wrong format. Use YYYY-MM-DD.'));
    return;
  }

  final patientData = {
    'first_name': firstNameController.text,
    'last_name': lastNameController.text,
    'birthday': birthdayString,
    'phone': phoneNumberController.text,
    'profile_photo': profilePhoto,
    'gender': selectedGender,
    'blood': selectedBlood,
  };

  emit(PatientCreateLoading());
  final success = await _patientService.createPatient(patientData);
  if (success) {
    emit(PatientCreateLoaded());
  } else {
    emit(PatientCreateError('Failed to create patient'));
  }
}


  Future<void> selectProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);
      emit(PatientPhotoSelected(profilePhoto));
    } else {
      emit(PatientPhotoError('No photo selected'));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthDayController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}