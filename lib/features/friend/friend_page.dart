import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/friend/friend_search_delegate.dart';
import 'package:my_tarot/features/friend/ui/bloc/bloc.dart';
import 'package:my_tarot/features/friend/ui/widgets/chat_group_list.dart';
import 'package:my_tarot/features/shared/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FriendBloc>(context);

    return BlocBuilder<FriendBloc, FriendState>(
      bloc: bloc,
      builder: (context, state) =>
          Scaffold(
            appBar: _buildAppBar(context),
            body: bloc.user != null
                ? ChatGroupList()
                : Center(
              child: Text(
                "Please sign in.",
              ),
            ),
            bottomNavigationBar: BottomBar(
              index: 1,
            ),
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
