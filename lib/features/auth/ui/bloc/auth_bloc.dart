import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/models/user.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _localDb = GetIt.I<MoorDb>();
  final _remoteDb = GetIt.I<FirestoreDb>();

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if (event is CheckingSignInEvent) {
      final user = await Auth.currentUser;
      if (user == null) {
        yield NotSignInState();
      } else {
        yield AlreadySuccessState(user);
      }
    } else if (event is SignInEvent) {
      yield LoadingState();
      final user = await Auth.signWithGoogleSignIn();
      if (user == null) {
        yield SignInFailState();
      } else {
        _remoteDb.userDao.getUser(user.uid).then((doc) {
          if (!doc.exists) {
            _remoteDb.userDao.addUser(User(
                id: user.uid,
                email: user.email,
                displayName: user.displayName,
                photoUrl: user.photoUrl,
                createdDate: DateTime.now()));
          }
        });
        _saveUser(user);
        _updateNote();
        yield AlreadySuccessState(user);
      }
    } else if (event is SignOutEvent) {
      _signOut();
      yield NotSignInState();
    }
  }

  void _signOut() {
    Auth.signOut();
  }

  void _updateNote() {
    Auth.currentUser.then((user) => _localDb.noteDao.updateUserId(user.uid));
  }

  void _saveUser(FirebaseUser user) {
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString('USER_ID', user.uid));
  }
}
