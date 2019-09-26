import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_tarot/features/setting/setting_enum.dart';

@immutable
abstract class SettingEvent extends Equatable {
  SettingEvent([List props = const <dynamic>[]]) : super(props);
}

class SettingChangeEvent extends SettingEvent {
  final Setting setting;
  final dynamic value;

  SettingChangeEvent(this.setting, this.value);
}
