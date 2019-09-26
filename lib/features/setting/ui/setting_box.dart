import 'package:flutter/material.dart';

import 'widgets/setting_item.dart';

class SettingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;

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
  }
}
