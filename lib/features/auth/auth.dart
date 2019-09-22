import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_tarot/features/auth/google_auth.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> get currentUser async =>
      await _auth.currentUser();

  static Future<FirebaseUser> signWithGoogleSignIn() async {
    var ggUser = GoogleAuth.currentUser;
    if (ggUser == null) {
      ggUser = await GoogleAuth.getSignedInAccount();
    }
    final user = await currentUser;
    if (user == null) {
      final GoogleSignInAuthentication googleAuth =
      await ggUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      return authResult.user;
    } else {
      return user;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
    await GoogleAuth.signOut();
  }
}
