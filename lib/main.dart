import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/features/app.dart';
import 'package:my_tarot/features/auth/auth.dart';

void main() {
  GetIt.I.registerSingleton(Auth());
  GetIt.I.registerSingleton(MoorDb());
  GetIt.I.registerSingleton(FirestoreDb());
  GetIt.I.registerSingleton(Connectivity());
  runApp(App());
}
