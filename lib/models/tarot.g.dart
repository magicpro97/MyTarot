// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarot _$TarotFromJson(Map<String, dynamic> json) {
  return Tarot(
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$TarotToJson(Tarot instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
