import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/auth/ui/bloc/auth_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:my_tarot/features/friend/friend_page.dart';
import 'package:my_tarot/features/friend/ui/bloc/bloc.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';
import 'package:my_tarot/features/home/ui/home_page.dart';
import 'package:my_tarot/features/setting/ui/bloc/bloc.dart';
import 'package:my_tarot/features/shared/page_name_enum.dart';
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
        BlocProvider.value(
          value: SettingBloc(),
        ),
        BlocProvider.value(
          value: FriendBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'My Tarot',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            )),
        routes: {
          PageName.SLASH_PAGE.toString(): (context) =>
              SlashPage(logoUrl: 'assets/icons/tarot.svg'),
          PageName.HOME_PAGE.toString(): (context) => HomePage(),
          PageName.FRIEND_PAGE.toString(): (context) => FriendPage(),
        },
        initialRoute: PageName.SLASH_PAGE.toString(),
      ),
    );
  }
}
