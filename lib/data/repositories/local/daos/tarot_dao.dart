import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/local/tables/tarot_table.dart';

part 'tarot_dao.g.dart';

@UseDao(tables: [TarotTable])
class TarotDao extends DatabaseAccessor<MoorDb> with _$TarotDaoMixin {
  TarotDao(MoorDb db) : super(db);
}
