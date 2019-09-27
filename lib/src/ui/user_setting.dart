import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';

class UserSetting extends StatelessWidget {
  static const routeInfo = {
    'title': 'User Setting',
    'routeName': '/user-setting',
    'icon': Icons.settings,
  };
  @override
  Widget build(BuildContext context) {
    return HomeGiftWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
      ),
    );
  }
}
