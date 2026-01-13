
class AppointmentCreeate {
    final int? doctor;
    final DateTime? time;
    final int? apointmentType;
    final int? patient;

    AppointmentCreeate({
        this.doctor,
        this.time,
        this.apointmentType,
        this.patient,
    });

    AppointmentCreeate copyWith({
        int? doctor,
        DateTime? time,
        int? apointmentType,
        int? patient,
    }) => 
        AppointmentCreeate(
            doctor: doctor ?? this.doctor,
            time: time ?? this.time,
            apointmentType: apointmentType ?? this.apointmentType,
            patient: patient ?? this.patient,
        );

    factory AppointmentCreeate.fromJson(Map<String, dynamic> json) => AppointmentCreeate(
        doctor: json["doctor"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        apointmentType: json["apointment_type"],
        patient: json["patient"],
    );

    Map<String, dynamic> toJson() => {
        "doctor": doctor,
        "time": "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
        "apointment_type": apointmentType,
        "patient": patient,
    };
}
