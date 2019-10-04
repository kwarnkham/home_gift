import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';
import 'widget/login/login_form.dart';
import 'ui/about.dart';
import './widget/home_gift_wrapper.dart';
import './home_gift_theme.dart';
import 'ui/user_setting.dart';
import 'widget/fab.dart';
import 'widget/bottom_tab_bar.dart';
import 'ui/search_item.dart';
import './widget/auth_data.dart';

class App extends StatefulWidget {
  final int initialTab;
  App({this.initialTab = 0});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  TabController _controller;

  _exitApp(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  @override
  void initState() {
    _controller = new TabController(vsync: this, length: 5, initialIndex: widget.initialTab);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _apiToken = AuthData.of(context).user.apiToken;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: HomeGiftTheme.primarcySwatch,
        accentColor: HomeGiftTheme.secondayColor,
        bottomAppBarColor: HomeGiftTheme.primaryColor,
      ),
      title: 'Home Gift',
      home: WillPopScope(
        onWillPop: () => _exitApp(context),
        child: HomeGiftWrapper(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: MyAppBar(),
            bottomNavigationBar: BottomTabBar(controller: _controller,),
            floatingActionButton: Fab(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
              controller: _controller,
              children: <Widget>[
                Home(),
                History(),
                Image.asset('assets/images/item_placeholder.png'),
                _apiToken == null ? LoginForm() : UserSetting(),
                About(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  _searchItem(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchItem()));
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: HomeGiftTheme.gradientFirstColor,
      title: Text('Home Gift'),
      actions: <Widget>[
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.search,
              color: HomeGiftTheme.primarcySwatch,
            ),
            onPressed: () {
              _searchItem(context);
            },
            iconSize: 40,
          ),
        ),
      ],
    );
  }
}
