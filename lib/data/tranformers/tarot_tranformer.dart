import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';
import 'package:my_tarot/models/tarot.dart';

class TarotTransformer {
  final tarotListTransform =
      StreamTransformer<QuerySnapshot, List<Tarot>>.fromHandlers(
          handleData: (QuerySnapshot data, EventSink sink) => sink.add(
              data.documents.map((doc) => Tarot.fromJson(doc.data)).toList()));

  final tarotCardListTransform =
      StreamTransformer<List<Tarot>, List<TarotCard>>.fromHandlers(
          handleData: (List<Tarot> data, EventSink sink) => sink.add(data
              .map((tarot) => TarotCard(
                    tarot: tarot,
                  ))
              .toList()));
}
