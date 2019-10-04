import 'package:flutter/material.dart';
import './auth_data.dart';

class BottomTabBar extends StatelessWidget {
  final TabController controller;
  BottomTabBar({this.controller});
  @override
  Widget build(BuildContext context) {
    final _apiToken = AuthData.of(context).user.apiToken;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: TabBar(
          labelStyle: TextStyle(fontSize: 10),
          controller: controller,
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
            _apiToken == null
                ? Tab(
                    text: 'Login',
                    icon: Icon(Icons.person),
                  )
                : Tab(
                    text: 'Setting',
                    icon: Icon(Icons.settings),
                  ),
            Tab(
              text: 'About',
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
