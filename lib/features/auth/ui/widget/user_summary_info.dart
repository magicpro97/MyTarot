import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_event.dart';
import 'package:provider/provider.dart';

import '../../auth.dart';

class UserSummaryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayNameStyle = theme.textTheme.title;
    final emailStyle = theme.textTheme.caption;
    //final buttonTextStyle = theme.textTheme.button;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: FutureBuilder<FirebaseUser>(
          future: Auth.currentUser,
          builder: (context, snapshot) =>
          snapshot.hasData
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UserAvatar(user: snapshot.data),
              Text(
                snapshot.data.displayName,
                style: displayNameStyle,
              ),
              Text(
                snapshot.data.email,
                style: emailStyle,
              ),
              FlatButton(
                onPressed: () => _signOut(context),
                child: Text("Sign out"),
              )
            ],
          )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    authBloc.dispatch(SignOutEvent());
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 128,
      width: 128,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
            ),
          ),
//                  Positioned.fill(
//                      child: Align(
//                          alignment: Alignment.bottomRight,
//                          child: IconButton(
//                            icon: Icon(Icons.edit),
//                            tooltip: "Edit",
//                            onPressed: () {},
//                          ))),
        ],
      ),
    );
  }
}
