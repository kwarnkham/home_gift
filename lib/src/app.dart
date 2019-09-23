import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.yellow,
          bottomAppBarColor: Colors.amber),
      title: 'Home Gift',
      routes: {
        Home.routeName:(_)=>Home(),
        History.routeName:(_)=>History()
      },
    );
  }
}
