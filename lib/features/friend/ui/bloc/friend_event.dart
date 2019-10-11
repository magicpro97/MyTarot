import 'package:equatable/equatable.dart';
import 'package:my_tarot/data/models/message.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent([List props = const <dynamic>[]]) : super(props);
}

class CheckingImageStoragePermission extends FriendEvent {}

class RequestPermissionEvent extends FriendEvent {}

class GetImages extends FriendEvent {}

class SentMessage extends FriendEvent {
  final Message message;

  SentMessage(this.message) : super([message]);
}
