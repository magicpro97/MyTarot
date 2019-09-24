import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/features/detail/ui/detail_page.dart';
import 'package:shimmer/shimmer.dart';

class TarotCard extends StatelessWidget {
  final Tarot tarot;

  const TarotCard({Key key, this.tarot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardNameStyle = Theme.of(context).textTheme.title;

    return GestureDetector(
      onTap: () async =>
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      DetailPage(
                        tarot: tarot,
                      ))),
      child: Container(
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    placeholder: (_, __) =>
                        Shimmer.fromColors(
                          child: CircularProgressIndicator(),
                          highlightColor: Colors.red,
                          baseColor: Colors.yellow,
                        ),
                    imageUrl: tarot.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  tarot.name,
                  style: cardNameStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
