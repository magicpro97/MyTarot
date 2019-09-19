import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class InitialHomeBlocState extends HomeState {}

class NetworkConnectedState extends HomeState {}

class NetworkDisconnectedState extends HomeState {}

class LoadedState extends HomeState {}
