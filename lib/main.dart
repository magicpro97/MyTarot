import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/features/app.dart';
import 'package:my_tarot/features/auth/google_auth.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';

import 'features/auth/auth.dart';

void main() {
  GetIt.I.registerSingleton(Auth());
  GetIt.I.registerSingleton(GoogleAuth());
  GetIt.I.registerSingleton(AuthBloc());
  GetIt.I.registerSingleton(DetailBloc());
  GetIt.I.registerSingleton(MoorDb());
  GetIt.I.registerSingleton(HomeBloc());
  GetIt.I.registerSingleton(Connectivity());
  runApp(App());
}
