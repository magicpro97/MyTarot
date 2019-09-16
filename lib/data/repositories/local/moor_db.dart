import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_tarot/data/repositories/local/daos/tarot_dao.dart';
import 'package:my_tarot/data/repositories/local/tables/tarot_table.dart';

part 'moor_db.g.dart';

@UseMoor(tables: [TarotTable], daos: [TarotDao])
class MoorDb extends _$MoorDb{
  MoorDb() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));
  @override
  int get schemaVersion => 1;
}

