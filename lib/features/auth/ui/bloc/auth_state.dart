import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const <dynamic>[]]) : super(props);
}

class InitialAuthState extends AuthState {}

class AlreadySuccessState extends AuthState {
  AlreadySuccessState(FirebaseUser value);
}

class SignInFailState extends AuthState {}

class SignOutState extends AuthState {}

class NotSignInState extends AuthState {}

class LoadingState extends AuthState {}
