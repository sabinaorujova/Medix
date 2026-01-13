class DoctorDetailResponse {
  final int? id;
  final String? title;
  final String? cover;
  final int? experience;
  final String? field;
  final String? averageRating;
  final int? patients;
  final int? reviews;
  final List<Specialist>? specialist;
  final String? workingTime;
  final String? about;

  DoctorDetailResponse({
    this.id,
    this.title,
    this.cover,
    this.experience,
    this.field,
    this.averageRating,
    this.patients,
    this.reviews,
    this.specialist,
    this.workingTime,
    this.about,
  });

  factory DoctorDetailResponse.fromJson(Map<String, dynamic> json) => DoctorDetailResponse(
    id: json["id"],
    title: json["title"],
    cover: json["cover"],
    experience: json["experience"],
    field: json["field"],
    averageRating: json["average_rating"],
    patients: json["patients"],
    reviews: json["reviews"],
    specialist: json["specialist"] == null ? [] : List<Specialist>.from(json["specialist"]!.map((x) => Specialist.fromJson(x))),
    workingTime: json["working_time"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "cover": cover,
    "experience": experience,
    "field": field,
    "average_rating": averageRating,
    "patients": patients,
    "reviews": reviews,
    "specialist": specialist == null ? [] : List<dynamic>.from(specialist!.map((x) => x.toJson())),
    "working_time": workingTime,
    "about": about,
  };
}

class Specialist {
  final int? id;
  final String? name;

  Specialist({
    this.id,
    this.name,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}