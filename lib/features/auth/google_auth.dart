import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static const List<String> _googleSignInScope = const [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: _googleSignInScope,
  );

  Future<GoogleSignInAccount> getSignedInAccount() async {
    GoogleSignInAccount account = _googleSignIn.currentUser;
    if (account == null) {
      account = await _googleSignIn.signInSilently();
    }
    return account;
  }
}
