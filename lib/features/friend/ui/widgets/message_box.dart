import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/friend/ui/widgets/chat_bar.dart';
import 'package:my_tarot/features/friend/ui/widgets/message_item.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messages = [
      MessageItem(
        content: "Alo",
        sendingMessage: true,
        lastMessage: true,
      ),
      MessageItem(
        content: "Ala",
        sendingMessage: false,
        lastMessage: true,
      ),
      MessageItem(
        content: "Are you crazy?",
        sendingMessage: true,
        lastMessage: true,
      ),
      MessageItem(
        content: "Yes, why not.",
        sendingMessage: false,
        lastMessage: true,
      ),
      MessageItem(
        content: "Are you crazy?",
        sendingMessage: true,
        lastMessage: false,
      ),
      MessageItem(
        content: "Are you crazy?",
        sendingMessage: true,
        lastMessage: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Thắng béo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => messages.reversed.toList()[index],
            itemCount: messages.length,
          )),
          ChatBar(),
        ],
      ),
    );
  }
}
