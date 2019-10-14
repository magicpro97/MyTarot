import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'message.g.dart';

enum MessageType {
  TEXT,
  IMAGE,
  STICKER,
}

enum MessageStatus {
  SENT,
  SEEN,
}

@JsonSerializable()
class Message extends Equatable {
  final String id;
  final String userId;
  final String content;
  @JsonKey(defaultValue: MessageType.TEXT)
  final MessageType type;
  @JsonKey(defaultValue: false)
  final bool isDeleted;
  @JsonKey(defaultValue: MessageStatus.SENT)
  final MessageStatus status;
  final DateTime createdDate;

  Message({
    @required this.id,
    @required this.userId,
    @required this.content,
    this.type,
    this.isDeleted,
    this.status,
    @required this.createdDate,
  }) : super([id, userId, content, type, isDeleted, status, createdDate]);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
