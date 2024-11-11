// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_job.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalJobAdapter extends TypeAdapter<LocalJob> {
  @override
  final int typeId = 0;

  @override
  LocalJob read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalJob(
      id: fields[0] as String,
      role: fields[1] as String,
      companyName: fields[2] as String,
      location: fields[3] as String,
      isRemote: fields[4] as bool,
      text: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalJob obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.companyName)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.isRemote)
      ..writeByte(5)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalJobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
