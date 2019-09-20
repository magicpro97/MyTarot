import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tarot.g.dart';

@JsonSerializable()
class Tarot extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Tarot({this.id, this.name, this.description, this.imageUrl})
      : super([id, name, description, imageUrl]);

  factory Tarot.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TarotFromJson(json);

  Map<String, dynamic> toJson() => _$TarotToJson(this);
}
