import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final localDb = GetIt.I<MoorDb>();
  final _noteSheetController = BehaviorSubject<bool>.seeded(false);
  final _noteController = BehaviorSubject<String>();
  PersistentBottomSheetController _bottomSheetController;

  bool get isSheetOpen => _noteSheetController.value;
  String get content => _noteController.value;

  Function get updateSheetState => _noteSheetController.add;
  Function get updateNote => _noteController.add;

  Stream<bool> get sheetStateStream => _noteSheetController.stream;
  Stream<String> get noteStream => _noteController.stream;

  @override
  DetailState get initialState => InitialDetailState();

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is OpenNote) {
      _openNoteSheetHandler(event);
    } else if (event is CloseNote) {
      _closeNoteSheetHandler();
    }
  }

  void _closeNoteSheetHandler() {

    _bottomSheetController.close();
    updateSheetState(false);
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
}
