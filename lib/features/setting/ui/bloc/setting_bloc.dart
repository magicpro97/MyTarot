import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:my_tarot/features/setting/setting_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final _localDb = GetIt.I<MoorDb>();

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
                _localDb.noteDao.updateUserId(user.uid);
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
