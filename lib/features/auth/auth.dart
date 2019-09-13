import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser> get currentUser async =>
      await _auth.currentUser();

  Future<FirebaseUser> signWithGoogleSignIn(
      GoogleSignInAccount googleSignInAccount) async {
    final user = await currentUser;
    if (user == null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(googleAuth.accessToken);
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      print(authResult);
      return authResult.user;
    } else {
      return user;
    }
  }

  Future<void> signOut() async => await _auth.signOut();
}
