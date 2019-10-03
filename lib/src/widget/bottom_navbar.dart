import 'package:flutter/material.dart';
import '../ui/home.dart';
import '../ui/history.dart';
import '../ui/login.dart';
import '../ui/user_setting.dart';
import '../bloc/user_bloc.dart';
import '../model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BottomNavbar extends StatefulWidget {
  final int routedIndex;
  BottomNavbar(this.routedIndex);
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex;
  User user;
  getAppUser() async {
    String localToken;
    final storage = FlutterSecureStorage();
    localToken = await storage.read(key: 'hGApiToken');
    if (localToken == null) {
      userBloc.getAppUser();
    }
    if (localToken != null) {
      userBloc.getAuthUser(localToken);
    }
  }

  @override
  void initState() {
    _currentIndex = widget.routedIndex;
    userBloc.user.listen((value) => user = value);
    getAppUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: StreamBuilder<User>(
          stream: userBloc.user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Map<String, dynamic>> navItems = user.apiToken == null
                  ? [
                      Home.routeInfo,
                      Login.routeInfo,
                    ]
                  : [Home.routeInfo, History.routeInfo, UserSetting.routeInfo];
              return BottomNavigationBar(
                onTap: (navIndex) {
                  // setState(() {
                  //   _currentIndex = navIndex;
                  // });
                  Map<String, dynamic> routedItem;
                  navItems.asMap().forEach((index, value) {
                    if (index == navIndex) {
                      routedItem = value;
                    }
                  });
                  if (routedItem != null) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      routedItem['routeName'],
                      ModalRoute.withName('/'),
                      
                      arguments: navIndex
                    );
                  }
                },
                currentIndex: _currentIndex,
                selectedItemColor: Colors.teal,
                unselectedItemColor: Colors.blueGrey,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                iconSize: 30,
                selectedIconTheme: IconThemeData(size: 30),
                showUnselectedLabels: false,
                items: navItems
                    .map((item) => BottomNavigationBarItem(
                        icon: Icon(item['icon']), title: Text(item['title'])))
                    .toList(),
              );
            }
            return SizedBox();
          }),
    );
  }
}
