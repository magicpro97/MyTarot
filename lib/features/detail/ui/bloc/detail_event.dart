import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailEvent extends Equatable {
  DetailEvent([List props = const <dynamic>[]]) : super(props);
}

class OpenNote extends DetailEvent {}

class CloseNote extends DetailEvent {}
