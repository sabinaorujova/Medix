class PatientGet {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? tag;
  final DateTime? birthday;
  final String? phone;
  final String? gender;
  final String? blood;
  final String? profilePhoto;

  PatientGet({
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

  PatientGet copyWith({
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
    PatientGet(
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

  factory PatientGet.fromJson(Map<String, dynamic> json) => PatientGet(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    tag: json["tag"],
    birthday:
        json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
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