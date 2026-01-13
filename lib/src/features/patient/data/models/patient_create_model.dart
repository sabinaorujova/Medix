class PatientCreateModel {
  final String? firstName;
  final String? lastName;
  final DateTime? birthday;
  final String? tag;
  final String? phone;
  final int? gender;
  final int? blood;
  final String? profilePhoto;

  PatientCreateModel({
    this.firstName,
    this.lastName,
    this.birthday,
    this.tag,
    this.phone,
    this.gender,
    this.blood,
    this.profilePhoto,
  });

  PatientCreateModel copyWith({
    String? firstName,
    String? lastName,
    DateTime? birthday,
    String? tag,
    String? phone,
    int? gender,
    int? blood,
    String? profilePhoto,
  }) =>
    PatientCreateModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      tag: tag ?? this.tag,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      blood: blood ?? this.blood,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );

  factory PatientCreateModel.fromJson(Map<String, dynamic> json) =>
    PatientCreateModel(
      firstName: json["first_name"],
      lastName: json["last_name"],
      birthday: json["birthday"] == null
          ? null
          : DateTime.parse(json["birthday"]),
      tag: json["tag"],
      phone: json["phone"],
      gender: json["gender"],
      blood: json["blood"],
      profilePhoto: json["profile_photo"],
    );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "birthday": birthday != null
        ? "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}"
        : null,
    "tag": tag,
    "phone": phone,
    "gender": gender,
    "blood": blood,
    "profile_photo": profilePhoto,
  };
}