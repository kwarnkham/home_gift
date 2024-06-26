import 'package:flutter/material.dart';
import '../widget/home/home_carosel.dart';
import '../widget/home/home_locations.dart';
import '../widget/home/home_items.dart';


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
