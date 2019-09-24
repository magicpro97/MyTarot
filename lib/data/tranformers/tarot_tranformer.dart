import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';

class TarotTransformer {
  final tarotListTransform =
      StreamTransformer<QuerySnapshot, List<Tarot>>.fromHandlers(
          handleData: (data, sink) => sink.add(data.documents.map((doc) {
                return Tarot.fromJson(doc.data);
              }).toList()));

  final toTarotCardList =
      StreamTransformer<List<Tarot>, List<TarotCard>>.fromHandlers(
          handleData: (data, sink) => sink.add(data
              .map((tarot) => TarotCard(
                    tarot: tarot,
                  ))
              .toList()));

  final tarotTblDataTransform =
      StreamTransformer<List<Tarot>, List<TarotTableData>>.fromHandlers(
          handleData: (data, sink) => sink.add(data
              .map((tarot) => TarotTableData.fromJson(tarot.toJson()))
              .toList()));
}
