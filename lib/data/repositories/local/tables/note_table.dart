import 'package:moor_flutter/moor_flutter.dart';

class NoteTable extends Table {
  TextColumn get id => text()();

  TextColumn get tarotId => text()();

  TextColumn get userId => text()();

  TextColumn get content => text().nullable()();

  DateTimeColumn get createdDate =>
      dateTime().withDefault(Constant(DateTime.now())).nullable()();

  DateTimeColumn get updatedDate =>
      dateTime().withDefault(Constant(DateTime.now())).nullable()();
}
