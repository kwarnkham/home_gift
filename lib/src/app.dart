import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';
import 'widget/login/login_form.dart';
import 'ui/about.dart';
import './widget/home_gift_wrapper.dart';
import './home_gift_theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './bloc/user_bloc.dart';
import 'ui/user_setting.dart';
import 'widget/fab.dart';
import 'widget/bottom_tab_bar.dart';
import 'ui/search_item.dart';

class App extends StatelessWidget {
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

  _searchItem(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchItem()));
  }

  initalizeToken() async {
    final storage = new FlutterSecureStorage();
    String localToken = await storage.read(key: 'hGApiToken');
    if (localToken != null) {
      userBloc.getAuthUser(localToken);
    }
  }

  App() {
    initalizeToken();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
          scaffoldBackgroundColor: Colors.transparent,
          primarySwatch: HomeGiftTheme.primarcySwatch,
          accentColor: HomeGiftTheme.secondayColor,
          bottomAppBarColor: HomeGiftTheme.primaryColor),
      title: 'Home Gift',
      home: WillPopScope(
        onWillPop: () => _exitApp(context),
        child: HomeGiftWrapper(
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
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
              ),
              bottomNavigationBar: BottomTabBar(),
              floatingActionButton: Fab(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: TabBarView(
                children: <Widget>[
                  Home(),
                  History(),
                  SizedBox(),
                  LoginForm(),
                  About(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
