import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../ui/search_item.dart';
import '../widget/home/home_carosel.dart';
import '../widget/home/home_locations.dart';
import '../widget/bottom_navbar.dart';
import '../widget/home/home_items.dart';
import '../widget/fab.dart';

class Home extends StatelessWidget {
  static const Map<String, dynamic> routeInfo = {
    'title': 'Home',
    'routeName': '/',
    'icon': Icons.home,
  };


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            HomeCarosel(),
            HomeLocations(),
          ]),
        ),
        HomeItems()
      ],
    );
  }
}
