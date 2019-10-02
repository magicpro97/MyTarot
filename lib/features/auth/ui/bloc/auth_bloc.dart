import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/features/auth/auth.dart';

import 'bloc.dart';

enum User {
  OLD_ID,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final localDb = GetIt.I<MoorDb>();

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
      _updateNote();
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
  }

  void _updateNote() {
    Auth.currentUser.then((user) => localDb.noteDao.updateUserId(user.uid));
  }
}
