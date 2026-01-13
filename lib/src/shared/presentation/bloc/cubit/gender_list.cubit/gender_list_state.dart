
import '../../../../../features/patient/data/models/gender_list_model.dart';

abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderLoading extends GenderState {}

class GenderLoaded extends GenderState {
  final List<GenderListModel> genderList;

  GenderLoaded(this.genderList);
}

class GenderError extends GenderState {
  final String message;

  GenderError(this.message);
}