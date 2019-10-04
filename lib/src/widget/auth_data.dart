import 'package:flutter/material.dart';
import '../model/user.dart';

class AuthData extends InheritedWidget {
  const AuthData({
    Key key,
    @required this.user,
    @required Widget child,
  }) : assert(user != null),
       assert(child != null),
       super(key: key, child: child);

  final User user;

  static AuthData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AuthData) as AuthData;
  }

  @override
  bool updateShouldNotify(AuthData old) => user != old.user;
}