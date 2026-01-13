part of 'popular_doctor_cubit.dart';

@immutable
sealed class PopularDoctorState {}

final class PopularDoctorInitial extends PopularDoctorState {}
final class PopularDoctorLoading extends PopularDoctorState {}