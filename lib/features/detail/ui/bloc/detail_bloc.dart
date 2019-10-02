import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/models/note.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:my_tarot/features/setting/setting_enum.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import './bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  static const _TAG = "DetailBloc";
  final localDb = GetIt.I<MoorDb>();
  final remoteDb = GetIt.I<FirestoreDb>();
  final _noteSheetController = BehaviorSubject<bool>.seeded(false);
  final _noteController = BehaviorSubject<String>.seeded("");
  PersistentBottomSheetController _bottomSheetController;

  bool get isSheetOpen => _noteSheetController.value;

  String get noteContent => _noteController.value;

  Function get updateSheetState => _noteSheetController.add;

  Function get updateNote => _noteController.add;

  Stream<bool> get sheetStateStream => _noteSheetController.stream;

  Stream<String> get noteStream => _noteController.stream;

  Note _note;
  Tarot _tarot;

  DetailBloc() {
    Auth.userStream.listen((user) {
      if (user != null) {
        log("User has been sign in", name: _TAG);
        localDb.noteDao.watchNotes().listen((tbls) {
          SharedPreferences.getInstance().then((instant) {
            if (instant.getBool(Setting.SYNC.toString()) ?? false) {
              final notes = tbls.map((tbl) => Note.fromJson(tbl.toJson()));
              notes.forEach((note) {
                if (note.userId.isNotEmpty) {
                  remoteDb.noteDao.addNote(note);
                }
              });
            }
          });
        });
      }
    });
  }

  @override
  DetailState get initialState => InitialDetailState();

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is OpenNote) {
      yield LoadingState();
      await _getNote(event.tarot.id);
      yield LoadedState();
      _openNoteSheetHandler(event);
    } else if (event is CloseNote) {
      if (event.save) {
        yield LoadingState();
        await _saveNote();
        _closeNoteSheetHandler();
        yield LoadedState();
      }
      updateSheetState(false);
    }
  }

  void _closeNoteSheetHandler() {
    _bottomSheetController.close();
    _bottomSheetController = null;
  }

  void _openNoteSheetHandler(OpenNote event) {
    _bottomSheetController = event.bottomSheetController;
    updateSheetState(true);
  }

  @override
  void dispose() {
    _noteSheetController.close();
    _noteController.close();
    super.dispose();
  }

  Future<void> _getNote(String id) async {
    log("Get note by tarot id $id", name: _TAG);
    final docs =
        await Firestore.instance.collection("tarot").document(id).get();
    if (docs.exists) {
      _tarot = Tarot.fromJson(docs.data);
      final note = await localDb.noteDao.getNoteByTarotId(_tarot.id);
      if (note != null) {
        _note = Note.fromJson(note.toJson());
        print("${_note.toJson()}");
        updateNote(_note.content);
      } else {
        updateNote("");
      }
    } else {
      print("Can't get note!");
    }
  }

  Future<void> _saveNote() async {
    if (_note != null) {
      final temp = _note.toJson();
      log('Update $temp', name: _TAG);
      temp['content'] = noteContent;
      await localDb.noteDao.updateContent(NoteTableData.fromJson(temp));
    } else {
      log('Create a new note', name: _TAG);
      final user = await Auth.currentUser;
      localDb.noteDao.insertNote(NoteTableData(
        tarotId: _tarot.id,
        content: noteContent,
        userId: user != null ? user.uid : '',
        id: Uuid().v1(),
      ));
    }
    _note = null;
    updateNote("");
  }
}
