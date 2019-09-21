import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/local/tables/note_table.dart';

part 'note_dao.g.dart';

@UseDao(tables: [NoteTable])
class NoteDao extends DatabaseAccessor<MoorDb> with _$NoteDaoMixin {
  NoteDao(MoorDb db) : super(db);

  Future<int> insertNote(NoteTableData data) => into(noteTable).insert(data);

  Stream<NoteTableData> watchNote(String id) =>
      (select(noteTable)..where((note) => note.id.equals(id))).watchSingle();

  Future<NoteTableData> getNoteById(String id) =>
      (select(noteTable)
        ..where((note) => note.id.equals(id))).getSingle();
}
