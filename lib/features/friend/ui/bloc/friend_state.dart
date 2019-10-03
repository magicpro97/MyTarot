import 'package:equatable/equatable.dart';

abstract class FriendState extends Equatable {
  const FriendState([List props = const <dynamic>[]]) : super(props);
}

class InitialFriendState extends FriendState {}

class LoadingState extends FriendState {}

class PermissionGrantedState extends FriendState {}

class PermissionDeniedState extends FriendState {}
