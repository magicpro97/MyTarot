import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_tarot/models/tarot.dart';
import 'package:shimmer/shimmer.dart';

class TarotCardDetail extends StatelessWidget {
  final Tarot tarot;

  const TarotCardDetail({Key key, this.tarot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardNameStyle = Theme.of(context).textTheme.title;
//    final headerStyle = Theme.of(context).textTheme.caption;
//    final contentSytle = Theme.of(context).textTheme.body1;

    return Container(
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  placeholder: (_, __) => Shimmer.fromColors(
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
              tarot.description != null
                  ? Html(
                      data: tarot.description,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
