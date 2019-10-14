import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/friend/ui/bloc/bloc.dart';
import 'package:my_tarot/features/friend/ui/widgets/chat_group_item.dart';
import 'package:provider/provider.dart';

class ChatGroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FriendBloc>(context);

    return Container(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) =>
              ChatGroupItem(
                chatGroup: bloc.chatGroup[index],
          ),
          itemCount: bloc.chatGroup.length,
        ),
      ),
    );
  }
}
