import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/auth/auth.dart';

import 'widgets/setting_item.dart';

class SettingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;

    return StreamBuilder<FirebaseUser>(
        stream: Auth.userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          return Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Setting",
                      style: titleStyle,
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SettingItem(),
                ],
              ),
            ),
          );
        });
  }
}
