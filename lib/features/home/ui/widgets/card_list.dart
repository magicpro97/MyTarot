import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/detail/detail_page.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';
import 'package:my_tarot/models/tarot.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tarotSnapshot = Firestore.instance.collection('tarot').snapshots();
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Container(
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
    );
  }

  Future _goToDetailPage(BuildContext context, Tarot tarot) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(
            tarot: tarot,
          )));
}
