import 'package:moor_flutter/moor_flutter.dart';

class NoteTable extends Table {
  TextColumn get id => text()();
  TextColumn get tarotId => text()();
  TextColumn get userId => text()();
  TextColumn get content => text()();
}