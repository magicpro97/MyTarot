import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_tarot/features/friend/ui/bloc/bloc.dart';
import 'package:provider/provider.dart';

class ChatBar extends StatefulWidget {
  const ChatBar({
    Key key,
  }) : super(key: key);

  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  File image;
  bool showEmojiBoard;

  @override
  void initState() {
    super.initState();
    showEmojiBoard = false;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: image != null ? 116.0 : showEmojiBoard ? 350.0 : 48.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildChatBar(),
            showEmojiBoard
                ? _buildEmojiBoard()
                : Padding(
                    padding: EdgeInsets.all(0.0),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiBoard() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildChatBar() {
    final bloc = Provider.of<FriendBloc>(context);

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.camera,
            ),
            onPressed: () {
              ImagePicker.pickImage(source: ImageSource.camera)
                  .then((file) => setState(() => image = file));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.image,
            ),
            onPressed: () {
              ImagePicker.pickImage(source: ImageSource.gallery)
                  .then((file) => setState(() => image = file));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.insert_emoticon,
            ),
            onPressed: () => setState(() => showEmojiBoard = !showEmojiBoard),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          Expanded(
              child: image == null
                  ? TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Type here...",
                      ),
                      maxLines: 2,
                      minLines: 1,
                    )
                  : _buildImageMessage()),
          IconButton(
            icon: Icon(
              Icons.send,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildImageMessage() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.file(
          image,
          height: 100,
          width: 100,
        ));
  }
}
