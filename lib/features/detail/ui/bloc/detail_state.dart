import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailState extends Equatable {
  DetailState([List props = const <dynamic>[]]) : super(props);
}

class InitialDetailState extends DetailState {}

class LoadingState extends DetailState {}

class LoadedState extends DetailState {}