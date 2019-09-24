import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';
import 'home_gift_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: HomeGiftTheme.primarcySwatch,
          accentColor: HomeGiftTheme.secondayColor,
          bottomAppBarColor: HomeGiftTheme.primaryColor),
      title: 'Home Gift',
      routes: {
        Home.routeName: (_) => Container(
              child: Home(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HomeGiftTheme.gradientFirstColor,
                    HomeGiftTheme.gradientSecondColor
                  ],
                  begin: HomeGiftTheme.gradientStart,
                  end: HomeGiftTheme.graidentEnd,
                ),
              ),
            ),
        History.routeName: (_) => History()
      },
    );
  }
}
