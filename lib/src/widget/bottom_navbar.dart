import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  final int index;
  BottomNavbar({this.index});
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<Map<String, dynamic>> navItems = [
    {'title': 'Home', 'routeName': '/', 'icon': Icons.home, 'index': 0},
    {
      'title': 'History',
      'routeName': '/history',
      'icon': Icons.history,
      'index': 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomNavigationBar(
        onTap: (value) {
          final routedItem =
              navItems.firstWhere((item) => item['index'] == value);
          Navigator.of(context).pushReplacementNamed(routedItem['routeName']);
        },
        currentIndex: widget.index,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        iconSize: 30,
        selectedIconTheme: IconThemeData(size: 30),
        showUnselectedLabels: false,
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.home),
        //     title: Text('Home'),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.history),
        //     title: Text('History'),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.settings),
        //     title: Text('Settting'),
        //   ),
        // ],
        items: navItems
            .map((item) => BottomNavigationBarItem(
                icon: Icon(item['icon']), title: Text(item['title'])))
            .toList(),
      ),
    );
  }
}
