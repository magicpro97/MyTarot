import 'package:flutter/material.dart';
import 'package:my_tarot/features/shared/page_name_enum.dart';

class BottomBar extends StatelessWidget {
  final int index;

  const BottomBar({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).bottomAppBarColor;
    final unselectedLabelColor = Colors.black;
    final selectedLabelColors = Colors.blue;

    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      currentIndex: index,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Container(),
        ),
      ],
      onTap: (index) => _changePage(context, index),
    );
  }

  void _changePage(BuildContext context, int newIndex) {
    String pageName;
    if (index != newIndex) {
      switch (newIndex) {
        case 0:
          pageName = PageName.HOME_PAGE.toString();
          break;
        case 1:
          pageName = PageName.FRIEND_PAGE.toString();
          break;
      }

      Navigator.pushNamed(context, pageName);
    }
  }
}
