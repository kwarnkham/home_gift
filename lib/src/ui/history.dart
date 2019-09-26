import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';

class History extends StatelessWidget {
  static Map<String, dynamic> routeInfo = {
    'title': 'History',
    'routeName': '/history',
    'icon': Icons.history,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      bottomNavigationBar: BottomNavbar(
        index: 1,
      ),
    );
  }
}
