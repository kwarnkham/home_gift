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
  searchItem(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchItem()));
  }

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: ((_) => AlertDialog(
            title: new Text('Do you want to exit this application?'),
            // content: new Text('We hate to see you leave...'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        bottomNavigationBar: BottomNavbar(index: 0),
        floatingActionButton: Fab(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: HomeGiftTheme.gradientFirstColor,
              floating: true,
              title: Text('Home Gift'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: HomeGiftTheme.primarcySwatch,
                  ),
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
      ),
    );
  }
}
