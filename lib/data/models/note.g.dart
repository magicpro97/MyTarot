// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    id: json['id'] as String,
    tarotId: json['tarotId'] as String,
    userId: json['userId'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'tarotId': instance.tarotId,
  'userId': instance.userId,
      'content': instance.content,
    };
