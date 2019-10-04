import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './src/bloc/user_bloc.dart';
import './src/widget/auth_data.dart';
import './src/model/user.dart';
import './src/widget/home_gift_wrapper.dart';
import './src/home_gift_theme.dart';

void main() {
  initalizeToken() async {
    final storage = new FlutterSecureStorage();
    String localToken = await storage.read(key: 'hGApiToken');
    if (localToken != null) {
      userBloc.getAuthUser(localToken);
    }
    if (localToken == null) {
      userBloc.getAppUser();
    }
  }

  initalizeToken();

  return runApp(
    StreamBuilder<User>(
        stream: userBloc.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AuthData(
              child: App(),
              user: snapshot.data,
            );
          }
          return MaterialApp(
            title: 'Home Gift',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
              scaffoldBackgroundColor: Colors.transparent,
              primarySwatch: HomeGiftTheme.primarcySwatch,
              accentColor: HomeGiftTheme.secondayColor,
              bottomAppBarColor: HomeGiftTheme.primaryColor,
            ),
            home: HomeGiftWrapper(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Home Gift'),
                ),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }),
  );
}
