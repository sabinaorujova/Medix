import 'package:hive/hive.dart';

part 'patient_details_hive_model.g.dart';

@HiveType(typeId: 0)
class PatientDetailsHiveModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String lastname;

  @HiveField(2)
  late String birthday;

  @HiveField(3)
  late String imagePath;
}
