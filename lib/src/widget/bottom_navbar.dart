import 'package:flutter/material.dart';
import '../ui/home.dart';
import '../ui/history.dart';
import '../ui/user.dart';

class BottomNavbar extends StatefulWidget {
  final int index;
  BottomNavbar({this.index});
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<Map<String, dynamic>> navItems = [
    Home.routeInfo,
    History.routeInfo,
    User.routeInfo,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomNavigationBar(
        onTap: (navIndex) {
          Map<String, dynamic> routedItem;
          navItems.asMap().forEach((index, value) {
            if (index == navIndex) {
              routedItem = value;
            }
          });
          if (routedItem != null) {
            Navigator.of(context).pushReplacementNamed(routedItem['routeName']);
          }
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
