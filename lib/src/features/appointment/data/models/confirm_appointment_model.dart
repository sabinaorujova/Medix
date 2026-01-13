class ConfirmAppointmentModel {
  final int? id;
  final Doctor? doctor;
  final DateTime? time;
  final double? price;
  final String? appointmentType;
  final Patient? patient;

  ConfirmAppointmentModel({
    this.id,
    this.doctor,
    this.time,
    this.price,
    this.appointmentType,
    this.patient,
  });

  ConfirmAppointmentModel copyWith({
    int? id,
    Doctor? doctor,
    DateTime? time,
    double? price,
    String? appointmentType,
    Patient? patient,
  }) => 
    ConfirmAppointmentModel(
      id: id ?? this.id,
      doctor: doctor ?? this.doctor,
      time: time ?? this.time,
      price: price ?? this.price,
      appointmentType: appointmentType ?? this.appointmentType,
      patient: patient ?? this.patient,
    );

  factory ConfirmAppointmentModel.fromJson(Map<String, dynamic> json) => ConfirmAppointmentModel(
    id: json["id"],
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    price: json["price"]?.toDouble(),
    appointmentType: json["apointment_type"],
    patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor": doctor?.toJson(),
    "time": time != null
        ? "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}"
        : null,
    "price": price,
    "apointment_type": appointmentType,
    "patient": patient?.toJson(),
  };
}

class Doctor {
  final int? id;
  final String? title;
  final String? cover;
  final String? experience;
  final String? field;
  final String? averageRating;
  final String? patients;
  final String? reviews;

  Doctor({
    this.id,
    this.title,
    this.cover,
    this.experience,
    this.field,
    this.averageRating,
    this.patients,
    this.reviews,
  });

  Doctor copyWith({
    int? id,
    String? title,
    String? cover,
    String? experience,
    String? field,
    String? averageRating,
    String? patients,
    String? reviews,
  }) => 
    Doctor(
      id: id ?? this.id,
      title: title ?? this.title,
      cover: cover ?? this.cover,
      experience: experience ?? this.experience,
      field: field ?? this.field,
      averageRating: averageRating ?? this.averageRating,
      patients: patients ?? this.patients,
      reviews: reviews ?? this.reviews,
    );

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    title: json["title"],
    cover: json["cover"],
    experience: json["experience"],
    field: json["field"],
    averageRating: json["average_rating"],
    patients: json["patients"],
    reviews: json["reviews"],
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
  };
}

class Patient {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? tag;
  final DateTime? birthday;
  final String? phone;
  final String? gender;
  final String? blood;
  final String? profilePhoto;

  Patient({
    this.id,
    this.firstName,
    this.lastName,
    this.tag,
    this.birthday,
    this.phone,
    this.gender,
    this.blood,
    this.profilePhoto,
  });

  Patient copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? tag,
    DateTime? birthday,
    String? phone,
    String? gender,
    String? blood,
    String? profilePhoto,
  }) => 
    Patient(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      tag: tag ?? this.tag,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      blood: blood ?? this.blood,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    tag: json["tag"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    phone: json["phone"],
    gender: json["gender"],
    blood: json["blood"],
    profilePhoto: json["profile_photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "tag": tag,
    "birthday": birthday != null
        ? "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}"
        : null,
    "phone": phone,
    "gender": gender,
    "blood": blood,
    "profile_photo": profilePhoto,
  };
}