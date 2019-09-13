import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/auth/ui/user_drawer.dart';
import 'package:my_tarot/features/detail/detail_page.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';
import 'package:my_tarot/models/tarot.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final tarotSnapshot = Firestore.instance.collection('tarot').snapshots();

    return Scaffold(
      drawer: UserDrawer(),
      appBar: AppBar(
        title: Text("My Tarrot"),
        actions: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: tarotSnapshot,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                final tarots = snapshot.data.documents
                    .map((doc) => Tarot.fromSnapshot(doc))
                    .toList();
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => showSearch(
                        context: context, delegate: CardSearch(items: tarots)));
              }),
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: tarotSnapshot,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              final tarots = snapshot.data.documents
                  .map((doc) => Tarot.fromSnapshot(doc))
                  .toList();

              final tarotCards = tarots
                  .map(
                    (tarot) => GestureDetector(
                  child: TarotCard(
                    tarot: tarot,
                  ),
                  onTap: () => _goToDetailPage(context, tarot),
                ),
              )
                  .toList();

              return GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: tarotCards,
              );
            }),
      ),
    );
  }
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
