import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/features/auth/ui/user_profile.dart';
import 'package:my_tarot/features/detail/ui/detail_page.dart';
import 'package:my_tarot/features/home/ui/bloc/home_bloc.dart';
import 'package:my_tarot/features/home/ui/widgets/card_list.dart';
import 'package:my_tarot/features/setting/ui/setting_box.dart';
import 'package:my_tarot/features/shared/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) =>
          Scaffold(
            appBar: (state is ShowAppBarState) ||
                (state is InitialHomeBlocState)
                ? _buildAppBar()
                : _hideAppBar(),
            body: CardList(),
            bottomNavigationBar: BottomBar(index: 0,),
            drawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24.0,
                  ),
                  UserProfile(),
                  SettingBox(),
                ],
              ),
            ),
          ),
    );
  }

  AppBar _buildAppBar() {
    final tarotSnapshot = Firestore.instance.collection('tarot').snapshots();

    return AppBar(
      title: Text("My Tarrot"),
      actions: <Widget>[
        StreamBuilder<QuerySnapshot>(
            stream: tarotSnapshot,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              final tarots = snapshot.data.documents
                  .map((doc) => Tarot.fromJson(doc.data))
                  .toList();
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearch(
                      context: context, delegate: CardSearch(items: tarots)));
            }),
      ],
    );
  }

  Widget _hideAppBar() => PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(kToolbarHeight),
      );
}

Future _goToDetailPage(BuildContext context, Tarot tarot) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetailPage(
              tarot: tarot,
            )));

class CardSearch extends SearchDelegate {
  final List<Tarot> items;

  CardSearch({this.items});

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => null;

  @override
  Widget buildSuggestions(BuildContext context) {
    final queryStyle = Theme.of(context).textTheme.title;
    final resultStyle = Theme.of(context).textTheme.subtitle;

    final suggestions =
        items.where((key) => key.name.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => _goToDetailPage(context, items[index]),
        title: RichText(
            text: TextSpan(
                text: suggestions[index].name.substring(0, query.length),
                style: queryStyle,
                children: <InlineSpan>[
              TextSpan(
                text: suggestions[index].name.substring(query.length),
                style: resultStyle,
              )
            ])),
      ),
      itemCount: suggestions.length,
    );
  }
}
