import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/models/note.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:my_tarot/features/setting/setting_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  static const String _TAG = "SettingBloc";

  final _localDb = GetIt.I<MoorDb>();
  final _remoteDb = GetIt.I<FirestoreDb>();

  Future<SharedPreferences> get sharedPreference async =>
      await SharedPreferences.getInstance();

  @override
  SettingState get initialState => InitialSettingState();

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SettingChangeEvent) {
      switch (event.setting) {
        case Setting.SYNC:
          (await sharedPreference)
              .setBool(Setting.SYNC.toString(), event.value);
          if (event.value) {
            Auth.userStream.listen((user) {
              if (user != null) {
                log("Update user ${user.uid}", name: _TAG);
                _localDb.noteDao.updateUserId(user.uid);
                log("Get notes", name: _TAG);
                _remoteDb.noteDao.getNotesByUserId(user.uid).then((docs) => docs
                    .documents
                    .map((doc) => Note.fromJson(doc.data))
                    .forEach((note) =>
                        _localDb.noteDao.getNote(note.id).then((localNote) {
                          if (localNote == null) {
                            print(note.toJson());
                            _localDb.noteDao.insertNote(
                                NoteTableData.fromJson(note.toJson()));
                          }
                        })));
              }
            });
          }
          break;
      }
    }
  }

  Future<dynamic> getSetting(Setting setting) async {
    switch (setting) {
      case Setting.SYNC:
        return (await sharedPreference).getBool(setting.toString());
    }
  }
}
