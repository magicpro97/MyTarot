import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final _noteTarotStateController = BehaviorSubject<bool>.seeded(false);

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
      updateNoteState(true);
    } else if (event is CloseNote) {
      updateNoteState(false);
    }
  }

  @override
  void dispose() {
    _noteTarotStateController.close();
    super.dispose();
  }
}
