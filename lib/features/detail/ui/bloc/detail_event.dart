import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailEvent extends Equatable {
  DetailEvent([List props = const <dynamic>[]]) : super(props);
}

class OpenNote extends DetailEvent {
  final PersistentBottomSheetController bottomSheetController;

  OpenNote(this.bottomSheetController);
}

class CloseNote extends DetailEvent {}
