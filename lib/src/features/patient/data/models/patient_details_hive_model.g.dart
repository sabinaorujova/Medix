
part of 'patient_details_hive_model.dart';



class PatientDetailsHiveModelAdapter
    extends TypeAdapter<PatientDetailsHiveModel> {
  @override
  final int typeId = 0;

  @override
  PatientDetailsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientDetailsHiveModel()
      ..name = fields[0] as String
      ..lastname = fields[1] as String
      ..birthday = fields[2] as String
      ..imagePath = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, PatientDetailsHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientDetailsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
