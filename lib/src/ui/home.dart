import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../ui/search_item.dart';
import '../widget/home/home_carosel.dart';
import '../widget/home/home_locations.dart';
import '../widget/bottom_navbar.dart';
import '../widget/home/home_items.dart';
import '../widget/fab.dart';

class Home extends StatelessWidget {
  static const String routeName = '/';
  searchItem(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchItem()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      bottomNavigationBar: BottomNavbar(index: 0),

      floatingActionButton: Fab(),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: true,
            title: Text('Home Gift'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: HomeGiftTheme.primarcySwatch,),
                onPressed: () {
                  searchItem(context);
                },
                iconSize: 40,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              HomeCarosel(),
              HomeLocations(),
            ]),
          ),
          HomeItems()
        ],
      ),
    );
  }
}
