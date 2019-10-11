import 'package:flutter/material.dart';
import 'package:my_tarot/features/friend/friend_search_delegate.dart';
import 'package:my_tarot/features/friend/ui/widgets/message_group_list.dart';
import 'package:my_tarot/features/shared/widgets/bottom_bar.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MessageGroupList(),
      bottomNavigationBar: BottomBar(
        index: 1,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Friends'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: FriendSearch()))
      ],
    );
  }
}
