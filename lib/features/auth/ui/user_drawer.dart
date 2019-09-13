import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:my_tarot/features/auth/google_auth.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).buttonTheme.textTheme;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.google),
                  Text("Google"),
                ],
              ),
              color: Colors.deepOrange,
              textTheme: buttonStyle,
              onPressed: () async {
                print(await Auth.signWithGoogleSignIn(
                    await GoogleAuth.getSignedInAccount()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
