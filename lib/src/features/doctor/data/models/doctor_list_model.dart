class DoctorListModel {
  final int id;
  final String title;
  final String cover;
  final int experience;
  final String field;
  final String averageRating;
  final int patients;
  final int reviews;

  DoctorListModel({
    required this.id,
    required this.title,
    required this.cover,
    required this.experience,
    required this.field,
    required this.averageRating,
    required this.patients,
    required this.reviews,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      id: json['id'],
      title: json['title'],
      cover: json['cover'],
      experience: json['experience'],
      field: json['field'],
      averageRating: json['average_rating'],
      patients: json['patients'],
      reviews: json['reviews'],
    );
  }
}