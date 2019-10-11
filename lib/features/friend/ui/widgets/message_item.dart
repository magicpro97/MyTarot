import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatefulWidget {
  final bool sendingMessage;
  final bool lastMessage;
  final String content;

  const MessageItem({
    Key key,
    @required this.sendingMessage,
    @required this.content,
    this.lastMessage,
  }) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool showDetail = false;


  @override
  Widget build(BuildContext context) {
    bool lastMessage = widget.lastMessage ?? false;
    bool displayTrailingAvatar = widget.sendingMessage && lastMessage;
    bool displayLeadingAvatar = !widget.sendingMessage && lastMessage;

    return ListTile(
      trailing: displayTrailingAvatar
          ? Icon(Icons.people)
          : SizedBox(
              width: 24,
            ),
      leading: displayLeadingAvatar
          ? Icon(Icons.person_outline)
          : SizedBox(
              width: 24,
            ),
      title: Bubble(
        color: widget.sendingMessage ? Colors.blue : Colors.white,
        nip: !lastMessage
            ? BubbleNip.no
            : widget.sendingMessage ? BubbleNip.rightBottom : BubbleNip.leftBottom,
        alignment:
            widget.sendingMessage ? Alignment.topRight : Alignment.topLeft,
        child: Text(
          widget.content,
          textAlign: TextAlign.start,
        ),
      ),
      subtitle: showDetail
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Seen",
                textAlign:
                    widget.sendingMessage ? TextAlign.end : TextAlign.start,
              ),
            )
          : null,
      onTap: () => setState(() {
        showDetail = !showDetail;
      }),
    );
  }
}
