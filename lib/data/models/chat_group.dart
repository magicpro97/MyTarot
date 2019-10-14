import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:my_tarot/data/models/message.dart';

part 'chat_group.g.dart';

@JsonSerializable()
class ChatGroup {
  final String id;
  final String displayName;
  final String imageUrl;
  final DateTime createdDate;
  final List<String> memIds;
  final List<Message> messages;

  ChatGroup(
      {@required this.id,
      this.displayName,
      this.imageUrl,
      @required this.memIds,
      @required this.messages,
      @required this.createdDate});

  factory ChatGroup.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGroupToJson(this);
}
