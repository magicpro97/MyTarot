import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

enum User {
  OLD_ID,
}
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  BehaviorSubject<FirebaseUser> _userController;

  FirebaseUser get user => _userController.value;

  Stream<FirebaseUser> get userStream => _userController.stream;

  Function get updateUser => _userController.sink.add;

  AuthBloc() {
    _userController = BehaviorSubject();
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString(User.OLD_ID.toString()) != user.uid) {
        prefs.setString(User.OLD_ID.toString(), user.uid);
      }
    });
  }

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckingSignInEvent) {
      updateUser(await Auth.currentUser);
      if (user == null) {
        yield NotSignInState();
      } else {
        yield AlreadySuccessState(user);
      }
    } else if (event is SignInEvent) {
      yield LoadingState();
      updateUser(await Auth.signWithGoogleSignIn());
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
    Auth.signOut();
    updateUser(null);
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
