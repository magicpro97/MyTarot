import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';
import 'package:my_tarot/features/slash/bloc/slash_bloc.dart';
import 'package:my_tarot/features/slash/ui/slash_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        BlocProvider.value(
          value: AuthBloc(),
        ),
        BlocProvider.value(
          value: HomeBloc(),
        ),
        BlocProvider.value(
          value: DetailBloc(),
        ),
        BlocProvider.value(
          value: SlashBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'My Tarot',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            )),
        home: SlashPage(logoUrl: 'assets/icons/tarot.svg'),
      ),
    );
  }
}
