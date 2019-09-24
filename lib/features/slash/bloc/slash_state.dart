import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SlashState extends Equatable {
  SlashState([List props = const <dynamic>[]]) : super(props);
}

class InitialSlashState extends SlashState {}
