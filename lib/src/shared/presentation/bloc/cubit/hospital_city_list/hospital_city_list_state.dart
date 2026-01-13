part of 'hospital_city_list_cubit.dart';

@immutable
sealed class HospitalCityListState {}

final class HospitalCityListInitial extends HospitalCityListState {}

final class HospitalCityListLoading extends HospitalCityListState {}

final class HospitalCityListSuccess extends HospitalCityListState {}

final class HospitalCityListError extends HospitalCityListState {}