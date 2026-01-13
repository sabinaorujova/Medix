

import 'dart:io';

sealed class PatientCreateState {}

final class PatientCreateInitial extends PatientCreateState {}
final class PatientCreateLoading extends PatientCreateState {}
final class PatientCreateLoaded extends PatientCreateState {}
final class PatientCreateError extends PatientCreateState {
  final String message;

  PatientCreateError(this.message);
}
class PatientPhotoSelected extends PatientCreateState {
  final File? photo;

  PatientPhotoSelected(this.photo);
}

class PatientPhotoError extends PatientCreateState {
  final String message;

  PatientPhotoError(this.message);
}
