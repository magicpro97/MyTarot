import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/app.dart';
import 'package:my_tarot/features/auth/google_auth.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';

import 'features/auth/auth.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton(Auth());
  getIt.registerSingleton(GoogleAuth());
  getIt.registerSingleton(AuthBloc());
  getIt.registerSingleton(DetailBloc());
  runApp(App());
}
