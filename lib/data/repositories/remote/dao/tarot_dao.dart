import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/data/tranformers/tarot_tranformer.dart';

class TarotDao with TarotTransformer {
  Stream<List<Tarot>> get tarotListStream => Firestore.instance
      .collection('tarot')
      .snapshots()
      .transform(tarotListTransform);

  Future<List<Tarot>> get tarotList async =>
      (await Firestore.instance.collection('tarot').getDocuments())
          .documents
          .map((doc) => Tarot.fromJson(doc.data));
}
