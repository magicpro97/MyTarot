import 'package:flutter/material.dart';
import 'package:my_tarot/features/slash/ui/slash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tarot',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      home: SlashPage(logoUrl: 'assets/icons/tarot.svg'),
    );
  }
}
