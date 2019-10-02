import 'package:my_tarot/data/repositories/remote/daos/note_dao.dart';
import 'package:my_tarot/data/repositories/remote/daos/tarot_dao.dart';
import 'package:my_tarot/data/repositories/remote/daos/user_dao.dart';

class FirestoreDb {
  final _tarotDao = TarotDao();
  final _noteDao = NoteDao();
  final _userDao = UserDao();

  TarotDao get tarotDao => _tarotDao;

  NoteDao get noteDao => _noteDao;

  UserDao get userDao => _userDao;
}
