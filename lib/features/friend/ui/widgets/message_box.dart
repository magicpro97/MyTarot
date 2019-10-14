import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/data/models/message.dart';
import 'package:my_tarot/features/friend/ui/bloc/bloc.dart';
import 'package:my_tarot/features/friend/ui/widgets/chat_bar.dart';
import 'package:provider/provider.dart';

import 'message_item.dart';

class MessageBox extends StatelessWidget {
  final String groupId;

  const MessageBox({Key key, @required this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FriendBloc>(context);

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        List<Message> messages =
            bloc.chatGroup
                .firstWhere((group) => group.id == groupId)
                .messages;

        List<Widget> messageItems = messages
            .asMap()
            .map((index, message) =>
            MapEntry(index, _buildMessageItem(bloc.user, message)))
            .values.toList();

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
                    itemBuilder: (context, index) =>
                    messageItems.reversed.toList()[index],
                    itemCount: messages.length,
                  )),
              ChatBar(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageItem(FirebaseUser user, Message message) {
    return MessageItem(
      sendingMessage: user.uid == message.userId,
      content: message.content,
    );
  }
}
