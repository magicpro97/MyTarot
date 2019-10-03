import 'package:equatable/equatable.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent([List props = const <dynamic>[]]) : super(props);
}

class CheckingImageStoragePermission extends FriendEvent {}

class RequestPermissionEvent extends FriendEvent {}

class GetImages extends FriendEvent {}
