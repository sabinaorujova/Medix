class CallModel {
  final String? callId;
  final int? appointmentId;
  final String? status;
  final DateTime? startTime;
  final DateTime? endTime;

  CallModel({
    this.callId,
    this.appointmentId,
    this.status,
    this.startTime,
    this.endTime,
  });

  factory CallModel.fromJson(Map<String, dynamic> json) =>
    CallModel(
      callId: json["call_id"],
      appointmentId: json["appointment_id"],
      status: json["status"],
      startTime: json["start_time"] == null
          ? null
          : DateTime.parse(json["start_time"]),
      endTime: json["end_time"] == null
          ? null
          : DateTime.parse(json["end_time"]),
    );

  Map<String, dynamic> toJson() => {
    "call_id": callId,
    "appointment_id": appointmentId,
    "status": status,
    "start_time": startTime?.toIso8601String(),
    "end_time": endTime?.toIso8601String(),
  };
}