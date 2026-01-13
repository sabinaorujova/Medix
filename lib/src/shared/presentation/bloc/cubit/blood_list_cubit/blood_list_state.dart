
import '../../../../../features/patient/data/models/blood_list_model.dart';

abstract class BloodState {}

class BloodInitial extends BloodState {}

class BloodLoading extends BloodState {}

class BloodLoaded extends BloodState {
  final List<BloodListModel> bloodList;

  BloodLoaded(this.bloodList);
}

class BloodError extends BloodState {
  final String message;

 BloodError(this.message);
}