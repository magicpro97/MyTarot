import 'package:flutter/material.dart';
import 'package:my_tarot/data/models/chat_group.dart';
import 'package:my_tarot/data/models/message.dart';

import 'message_box.dart';

class ChatGroupItem extends StatelessWidget {
  final ChatGroup chatGroup;

  const ChatGroupItem({Key key, this.chatGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content;
    Message lastMessage = chatGroup.messages.last;
    MessageType messageType = chatGroup.messages.last.type;
    switch (messageType) {
      case MessageType.TEXT:
        content = lastMessage.content;
        break;
      case MessageType.IMAGE:
        content = '${lastMessage.userId} have been sent a image.';
        break;
      case MessageType.STICKER:
        content = '${lastMessage.userId} have been sent a sticker.';
        break;
    }

    return Container(
      child: Card(
        child: ListTile(
          leading: Text("T"),
          title: Text(lastMessage.userId),
          subtitle: Text(content),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MessageBox(
                        groupId: chatGroup.id,
                      ))),
        ),
      ),
    );
  }
}
