import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';
import '../widget/bottom_navbar.dart';
import './home.dart';

class UserSetting extends StatefulWidget {
  static const routeInfo = {
    'title': 'User Setting',
    'routeName': '/user-setting',
    'icon': Icons.settings,
  };

  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  bool isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeGiftWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
        bottomNavigationBar: BottomNavbar(
          index: 2,
        ),
        body: StreamBuilder<User>(
            stream: userBloc.user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: snapshot.data.apiToken != null
                      ? isLoading
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              child: Text('Logout'),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                userBloc
                                    .logout(snapshot.data.apiToken)
                                    .then((_) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      Home.routeInfo['routeName'],
                                      ModalRoute.withName('/'));
                                });
                              },
                            )
                      : SizedBox(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
