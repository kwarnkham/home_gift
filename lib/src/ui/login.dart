import 'package:flutter/material.dart';
import '../widget/login/login_form.dart';

class Login extends StatelessWidget {
  // static const Map<String, dynamic> routeInfo = {
  //   'title': 'Login',
  //   'routeName': '/login',
  //   'icon': Icons.person,
  // };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(),
    );
  }
}
