import 'package:flutter/material.dart';

class FriendSearch extends SearchDelegate {
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

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => {},
        title: RichText(
            text: TextSpan(
                text: /*suggestions[index].name.substring(0, query.length)*/ "",
                style: queryStyle,
                children: <InlineSpan>[
              TextSpan(
                text: /*suggestions[index].name.substring(query.length)*/ "",
                style: resultStyle,
              )
            ])),
      ),
      itemCount: /*suggestions.length*/ 0,
    );
  }
}
