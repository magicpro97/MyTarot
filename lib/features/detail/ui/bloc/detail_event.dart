import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_tarot/models/tarot.dart';

@immutable
abstract class DetailEvent extends Equatable {
  DetailEvent([List props = const <dynamic>[]]) : super(props);
}

class OpenNote extends DetailEvent {
  final PersistentBottomSheetController bottomSheetController;

  final Tarot tarot;

  OpenNote(this.bottomSheetController, this.tarot)
      : super([
    [bottomSheetController, tarot]
  ]);
}

class CloseNote extends DetailEvent {
  final bool save;

  CloseNote({this.save}) : super([save]);
}
