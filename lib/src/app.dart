import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';
import 'ui/user.dart';
import './widget/home_gift_wrapper.dart';
import './home_gift_theme.dart';

class App extends StatelessWidget {
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
      routes: {
        Home.routeInfo['routeName']: (_) => HomeGiftWrapper(
              child: Home(),
            ),
        History.routeInfo['routeName']: (_) => HomeGiftWrapper(
              child: History(),
            ),
        User.routeInfo['routeName']: (_) => HomeGiftWrapper(
              child: User(),
            ),
      },
    );
  }
}
