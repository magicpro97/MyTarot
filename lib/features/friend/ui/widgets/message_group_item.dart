import 'package:flutter/material.dart';
import 'package:my_tarot/data/models/message.dart';

import 'message_box.dart';

class MessageGroupItem extends StatelessWidget {
  final Message message;

  const MessageGroupItem({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content;
    switch(message.type) {
      case MessageType.TEXT:
        content = message.content;
        break;
      case MessageType.IMAGE:
        content = '${message.userId} have been sent a image.';
        break;
      case MessageType.STICKER:
        content = '${message.userId} have been sent a sticker.';
        break;
    }

    return Container(
      child: Card(
        child: ListTile(
          leading: Text("T"),
          title: Text(message.userId),
          subtitle: Text(content),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MessageBox())),
        ),
      ),
    );
  }
}
