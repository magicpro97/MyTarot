import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tarot/data/models/note.dart';

class NoteDao {
  Future<void> addNote(Note note) => Firestore.instance
      .collection('notes')
      .document(note.id)
      .setData(note.toJson());

  Future<DocumentReference> updateNote(Note note) => Firestore.instance
      .collection('notes')
      .document(note.id)
      .updateData(note.toJson());
}
