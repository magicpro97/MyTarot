import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SettingState extends Equatable {
  SettingState([List props = const <dynamic>[]]) : super(props);
}

class InitialSettingState extends SettingState {}
