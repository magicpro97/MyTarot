import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_event.dart';

class UserSummaryInfo extends StatelessWidget {
  final FirebaseUser user;

  const UserSummaryInfo({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayNameStyle = theme.textTheme.title;
    final emailStyle = theme.textTheme.caption;
    final buttonTextStyle = theme.textTheme.button;

    return Container(
      width: double.infinity,
      //height: 200.0,
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              height: 128,
              width: 128,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          CachedNetworkImageProvider(user.photoUrl),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: "Edit",
                            onPressed: () {},
                          ))),
                ],
              ),
            ),
            Text(
              user.displayName,
              style: displayNameStyle,
            ),
            Text(
              user.email,
              style: emailStyle,
            ),
            FlatButton(
                onPressed: () {
                  _signOut();
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }

  void _signOut() {
    final authBloc = GetIt.I<AuthBloc>();
    authBloc.dispatch(SignOutEvent());
  }
}
