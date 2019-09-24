import 'package:my_tarot/data/repositories/remote/dao/tarot_dao.dart';

class FirestoreDb {
  final _tarotDao = TarotDao();

  TarotDao get tarotDao => _tarotDao;
}
