import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SlashEvent extends Equatable {
  SlashEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadingEvent extends SlashEvent {
  final BuildContext context;

  LoadingEvent(this.context) : super([context]);
}
