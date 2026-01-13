import 'package:hive/hive.dart';

part 'confirm_appointment_hive_model.g.dart';

@HiveType(typeId: 0)
class ConfirmAppointmentHiveModel extends HiveObject {
  @HiveField(0)
  late String location;

  @HiveField(1)
  late String hospitalName;

  @HiveField(2)
  late String doctorName;

  @HiveField(3)
  late String date;

  @HiveField(4)
  late String time;
}
