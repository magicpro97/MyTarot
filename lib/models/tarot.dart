import 'package:json_annotation/json_annotation.dart';

part 'tarot.g.dart';

@JsonSerializable()
class Tarot {
  final String name;
  final String description;
  final String imageUrl;

  //final DocumentReference reference;

  Tarot({this.name, this.description, this.imageUrl});

  factory Tarot.fromJson(Map<String, dynamic> json,) =>
      _$TarotFromJson(json);

  Map<String, dynamic> toJson() => _$TarotToJson(this);

//  Tarot.fromMap(Map<String, dynamic> map, {this.reference})
//      : name = map['name'],
//        description = map['description'],
//        imageUrl = map['imageUrl'];
//
//  Tarot.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
