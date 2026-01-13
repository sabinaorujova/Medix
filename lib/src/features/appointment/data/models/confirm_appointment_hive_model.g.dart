
part of 'confirm_appointment_hive_model.dart';



class ConfirmAppointmentHiveModelAdapter
    extends TypeAdapter<ConfirmAppointmentHiveModel> {
  @override
  final int typeId = 0;

  @override
  ConfirmAppointmentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfirmAppointmentHiveModel()
      ..location = fields[0] as String
      ..hospitalName = fields[1] as String
      ..doctorName = fields[2] as String
      ..date = fields[3] as String
      ..time = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, ConfirmAppointmentHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.hospitalName)
      ..writeByte(2)
      ..write(obj.doctorName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfirmAppointmentHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
