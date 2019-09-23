import 'package:flutter/material.dart';
import 'ui/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        title: 'Home Gift',
        home: Home());
  }
}
