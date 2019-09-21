import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/local/tables/tarot_table.dart';

part 'tarot_dao.g.dart';

@UseDao(tables: [TarotTable])
class TarotDao extends DatabaseAccessor<MoorDb> with _$TarotDaoMixin {
  TarotDao(MoorDb db) : super(db);

  Stream<List<TarotTableData>> watchTarots() => select(tarotTable).watch();

  Future<TarotTableData> getTarotById(String id) =>
      (select(tarotTable)..where((tarot) => tarot.id.equals(id))).getSingle();

  Future<int> insertTarot(TarotTableData data) => into(tarotTable).insert(data);

  Future<void> insertTarots(List<TarotTableData> data) =>
      into(tarotTable).insertAll(data);

  Future<bool> replaceTarot(TarotTableData data) =>
      update(tarotTable).replace(data);

  Future<int> updateNoteTarot(TarotTableData data) =>
      (update(tarotTable)
        ..where((tarot) => tarot.id.equals(data.note)))
          .write(TarotTableCompanion(note: Value(data.note)));
}
