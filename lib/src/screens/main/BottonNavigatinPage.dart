import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/bluetooth.dart';
import 'package:history_maker/src/screens/introduction/location.dart';
import 'package:history_maker/src/screens/login/signup.dart';
import 'package:history_maker/src/screens/main/DiscoverPage.dart';
import 'package:history_maker/src/screens/main/MorePage.dart';
import 'package:history_maker/src/screens/main/PlaceholderWidget.dart';

class BottonNavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottonNavigationPageState();
  }
}

class _BottonNavigationPageState extends State<BottonNavigationPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DiscoverPage(),
    PlaceholderWidget(Colors.deepOrange),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible_forward),
            title: Text('Descubrir'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            title: Text('Parque'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('Más')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}