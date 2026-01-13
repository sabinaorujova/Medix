part of 'doctor_detail_cubit.dart';

@immutable
sealed class DoctorDetailState {}

final class DoctorDetailInitial extends DoctorDetailState {}

final class DoctorDetailLoading extends DoctorDetailState {}

final class DoctorDetailSuccess extends DoctorDetailState {}

final class DoctorDetailError extends DoctorDetailState {}