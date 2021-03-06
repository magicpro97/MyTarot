import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/local/tables/note_table.dart';

part 'note_dao.g.dart';

@UseDao(tables: [NoteTable])
class NoteDao extends DatabaseAccessor<MoorDb> with _$NoteDaoMixin {
  NoteDao(MoorDb db) : super(db);

  Future<int> insertNote(NoteTableData data) => into(noteTable).insert(data);

  Stream<List<NoteTableData>> watchNotes() => select(noteTable).watch();

  Stream<NoteTableData> watchNote(String id) =>
      (select(noteTable)..where((note) => note.id.equals(id))).watchSingle();

  Future<NoteTableData> getNoteByTarotId(String tarotId) =>
      (select(noteTable)..where((note) => note.tarotId.equals(tarotId)))
          .getSingle();

  Future updateContent(NoteTableData data) =>
      (update(noteTable)..where((note) => note.id.equals(data.id)))
          .write(NoteTableCompanion(
        content: Value(data.content),
        updatedDate: Value(DateTime.now()),
      ));

  Future<List<NoteTableData>> getNotes() => select(noteTable).get();

  Future<NoteTableData> getNote(String id) =>
      (select(noteTable)..where((note) => note.id.equals(id))).getSingle();

  Future updateUserId(String userId) =>
      (update(noteTable)..where((tbl) => tbl.userId.equals('')))
          .write(NoteTableCompanion(
        userId: Value(userId),
      ));
}
