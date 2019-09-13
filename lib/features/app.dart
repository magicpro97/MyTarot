import 'package:flutter/material.dart';
import 'package:my_tarot/features/home/ui/home_page.dart';

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
      home: HomePage(),
    );
  }
}
