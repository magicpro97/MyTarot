import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final _noteTarotStateController = BehaviorSubject<bool>.seeded(false);
  PersistentBottomSheetController _bottomSheetController;

  bool get isNoteOpen => _noteTarotStateController.value;

  Function get updateNoteState => _noteTarotStateController.add;

  Stream<bool> get noteStateStream => _noteTarotStateController.stream;

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
    updateNoteState(false);
    _bottomSheetController = null;
  }

  void _openNoteSheetHandler(OpenNote event) {
    _bottomSheetController = event.bottomSheetController;
    updateNoteState(true);
  }

  @override
  void dispose() {
    _noteTarotStateController.close();
    super.dispose();
  }
}
