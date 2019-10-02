import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tarot/data/models/user.dart';

class UserDao {
  Future<DocumentReference> addUser(User user) =>
      Firestore.instance.collection('users').add(user.toJson());

  Future<DocumentSnapshot> getUser(String id) =>
      Firestore.instance.collection('users').document(id).get();
}
