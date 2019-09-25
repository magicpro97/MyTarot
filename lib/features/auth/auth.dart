import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_tarot/features/auth/google_auth.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static const _TAG = 'Auth';

  static Future<FirebaseUser> get currentUser async =>
      await _auth.currentUser();

  static Future<FirebaseUser> signWithGoogleSignIn() async {
    log('Sign In', name: _TAG);
    final user = await currentUser;
    log('Current user: $user', name: _TAG);
    if (user == null) {
      var ggUser = GoogleAuth.currentUser;
      log('Current gg user: $ggUser', name: _TAG);
      if (ggUser == null) {
        log('GG Sign In', name: _TAG);
        ggUser = await GoogleAuth.getSignedInAccount();
        log('New gg user: $ggUser', name: _TAG);
        if (ggUser != null) {
          final googleAuth = await ggUser.authentication;
          final AuthCredential credential = GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final AuthResult authResult =
          await _auth.signInWithCredential(credential);
          log('New gg user: ${authResult.user}', name: _TAG);
          return authResult.user;
        }
      }
    }
    return user;
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await GoogleAuth.signOut();
  }
}
