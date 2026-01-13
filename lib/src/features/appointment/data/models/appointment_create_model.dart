class AppointmentCreate {
  final int? doctor;
  final DateTime? time;
  final int? appointmentType;
  final int? patient;

  AppointmentCreate({
    this.doctor,
    this.time,
    this.appointmentType,
    this.patient,
  });

  AppointmentCreate copyWith({
    int? doctor,
    DateTime? time,
    int? appointmentType,
    int? patient,
  }) => 
    AppointmentCreate(
      doctor: doctor ?? this.doctor,
      time: time ?? this.time,
      appointmentType: appointmentType ?? this.appointmentType,
      patient: patient ?? this.patient,
    );

  factory AppointmentCreate.fromJson(Map<String, dynamic> json) => AppointmentCreate(
    doctor: json["doctor"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    appointmentType: json["apointment_type"],
    patient: json["patient"],
  );

  Map<String, dynamic> toJson() => {
    "doctor": doctor,
    "time": time != null
        ? "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}"
        : null,
    "apointment_type": appointmentType,
    "patient": patient,
  };
}