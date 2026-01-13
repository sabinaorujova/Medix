abstract class DoctorsDetailsState {}

class DoctorsDetailsInitial extends DoctorsDetailsState {}

class DoctorsDetailsLoading extends DoctorsDetailsState {}

class DoctorsDetailsLoaded extends DoctorsDetailsState {
  final List<Map<String, dynamic>> doctorsList;

  DoctorsDetailsLoaded(this.doctorsList);
}

class DoctorsDetailsError extends DoctorsDetailsState {
  final String message;

  DoctorsDetailsError(this.message);
}