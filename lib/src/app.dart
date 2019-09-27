import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'ui/history.dart';
import 'ui/login.dart';
import './widget/home_gift_wrapper.dart';
import './home_gift_theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './bloc/user_bloc.dart';
import 'ui/user_setting.dart';

class App extends StatelessWidget {
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
    // print()
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
        Login.routeInfo['routeName']: (_) => HomeGiftWrapper(
              child: Login(),
            ),
        UserSetting.routeInfo['routeName']: (_) => HomeGiftWrapper(
              child: UserSetting(),
            ),
      },
    );
  }
}
