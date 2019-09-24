import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/features/app.dart';
import 'package:my_tarot/features/auth/auth.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(Auth());
  GetIt.I.registerSingleton(MoorDb());
  GetIt.I.registerSingleton(FirestoreDb());
  GetIt.I.registerSingleton(HomeBloc());
  GetIt.I.registerSingleton(AuthBloc());
  GetIt.I.registerSingleton(DetailBloc());
  GetIt.I.registerSingleton(Connectivity());
  runApp(App());
}
