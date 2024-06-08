import 'package:clean_architecture/presentation/pages/account/view/account_page.dart';
import 'package:clean_architecture/presentation/pages/courses/view/courses_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => BottomBar(),
      );

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _activePageIdx = 0;
  final _pages = [
    CoursesPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_activePageIdx),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Курсы"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Аккаунт"),
        ],
        currentIndex: _activePageIdx,
        onTap: (value) {
          setState(() {
            _activePageIdx = value;
          });
        },
      ),
    );
  }
}
