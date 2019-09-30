import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note extends Equatable {
  final String id;
  final String tarotId;
  final String userId;
  final String content;
  final DateTime createdDate;
  final DateTime updatedDate;

  Note({this.id, this.tarotId, this.userId, this.content, this.createdDate, this.updatedDate});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
