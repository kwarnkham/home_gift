import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';

class History extends StatelessWidget {
  static const String routeName = '/history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History'),),
      bottomNavigationBar: BottomNavbar(index: 1,),
    );
  }
}