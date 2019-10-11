import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:my_tarot/data/models/message.dart';
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
  List<Asset> assets = [];
  bool showEmojiBoard = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: showEmojiBoard ? 350.0 : 48.0,
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
              Icons.image,
            ),
            onPressed: loadAssets,
          ),
          IconButton(
            icon: Icon(
              Icons.insert_emoticon,
            ),
            onPressed: () => setState(() {
              showEmojiBoard = !showEmojiBoard;
            }),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          Expanded(
              child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: "Type here...",
            ),
            maxLines: 2,
            minLines: 1,
          )),
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

  Future<void> loadAssets() async {
    setState(() {
      assets = [];
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      assets = resultList;
    });
  }
}
