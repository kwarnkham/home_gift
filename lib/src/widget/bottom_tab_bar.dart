import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Home',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'History',
              icon: Icon(Icons.history),
            ),
            SizedBox(),
            
            Tab(
              text: 'Login',
              icon: Icon(Icons.person),
            ),
            Tab(
              text: 'Settings',
              icon: Icon(Icons.info),
            )
          ],
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.blueGrey,
          indicatorColor: Theme.of(context).bottomAppBarColor,
          unselectedLabelStyle: TextStyle(fontSize: 0),
        ),
      ),
    );
  }
}
