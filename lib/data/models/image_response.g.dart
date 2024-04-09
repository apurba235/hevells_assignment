// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageResponseAdapter extends TypeAdapter<ImageResponse> {
  @override
  final int typeId = 1;

  @override
  ImageResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageResponse(
      totalCount: fields[0] as int?,
      searchId: fields[1] as String?,
      page: fields[2] as int?,
      perPage: fields[3] as int?,
      spellcheckInfo: fields[4] as SpellcheckInfo?,
      data: (fields[5] as List?)?.cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, ImageResponse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.totalCount)
      ..writeByte(1)
      ..write(obj.searchId)
      ..writeByte(2)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.perPage)
      ..writeByte(4)
      ..write(obj.spellcheckInfo)
      ..writeByte(5)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpellcheckInfoAdapter extends TypeAdapter<SpellcheckInfo> {
  @override
  final int typeId = 2;

  @override
  SpellcheckInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpellcheckInfo(
      spellcheckedQuery: fields[6] as String?,
      origResultsCount: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SpellcheckInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(6)
      ..write(obj.spellcheckedQuery)
      ..writeByte(7)
      ..write(obj.origResultsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellcheckInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 3;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      id: fields[8] as String?,
      aspect: fields[9] as double?,
      assets: fields[10] as Assets?,
      contributor: fields[11] as Contributor?,
      description: fields[12] as String?,
      imageType: fields[13] as String?,
      hasModelRelease: fields[14] as bool?,
      mediaType: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(8)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.aspect)
      ..writeByte(10)
      ..write(obj.assets)
      ..writeByte(11)
      ..write(obj.contributor)
      ..writeByte(12)
      ..write(obj.description)
      ..writeByte(13)
      ..write(obj.imageType)
      ..writeByte(14)
      ..write(obj.hasModelRelease)
      ..writeByte(15)
      ..write(obj.mediaType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AssetsAdapter extends TypeAdapter<Assets> {
  @override
  final int typeId = 4;

  @override
  Assets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Assets(
      preview: fields[16] as Preview?,
      smallThumb: fields[17] as Preview?,
      largeThumb: fields[18] as Preview?,
      mosaic: fields[19] as Preview?,
      preview1000: fields[20] as Preview?,
      preview1500: fields[21] as Preview?,
      hugeThumb: fields[22] as Preview?,
    );
  }

  @override
  void write(BinaryWriter writer, Assets obj) {
    writer
      ..writeByte(7)
      ..writeByte(16)
      ..write(obj.preview)
      ..writeByte(17)
      ..write(obj.smallThumb)
      ..writeByte(18)
      ..write(obj.largeThumb)
      ..writeByte(19)
      ..write(obj.mosaic)
      ..writeByte(20)
      ..write(obj.preview1000)
      ..writeByte(21)
      ..write(obj.preview1500)
      ..writeByte(22)
      ..write(obj.hugeThumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PreviewAdapter extends TypeAdapter<Preview> {
  @override
  final int typeId = 5;

  @override
  Preview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preview(
      height: fields[23] as int?,
      width: fields[24] as int?,
      url: fields[25] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Preview obj) {
    writer
      ..writeByte(3)
      ..writeByte(23)
      ..write(obj.height)
      ..writeByte(24)
      ..write(obj.width)
      ..writeByte(25)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContributorAdapter extends TypeAdapter<Contributor> {
  @override
  final int typeId = 6;

  @override
  Contributor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contributor(
      id: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Contributor obj) {
    writer
      ..writeByte(1)
      ..writeByte(26)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContributorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
