import 'package:moor_flutter/moor_flutter.dart';

class TarotTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
