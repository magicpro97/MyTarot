import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../auth.dart';
import '../../google_auth.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final gAuth = GetIt.I<GoogleAuth>();
  final auth = GetIt.I<Auth>();
  final BehaviorSubject<FirebaseUser> _userController;

  FirebaseUser get user => _userController.value;

  Stream<FirebaseUser> get userStream => _userController.stream;

  Function get updateUser => _userController.sink.add;

  AuthBloc() : _userController = BehaviorSubject();

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckingSignIn) {
      if (user == null) {
        yield NotSignInState();
      } else {
        yield AlreadySuccessState(user);
      }
    } else if (event is SignInEvent) {
      yield LoadingState();
      updateUser(
          await auth.signWithGoogleSignIn(await gAuth.getSignedInAccount()));
      if (user == null) {
        yield SignInFailState();
      } else {
        yield AlreadySuccessState(user);
      }
    } else if (event is SignOutEvent) {
      _signOut();
      yield NotSignInState();
    }
  }

  void _signOut() {
    auth.signOut();
    updateUser(null);
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
