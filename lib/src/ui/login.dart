import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';
import '../widget/login/login_form.dart';

class Login extends StatefulWidget {
  static const Map<String, dynamic> routeInfo = {
    'title': 'Login',
    'routeName': '/login',
    'icon': Icons.person,
  };

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      bottomNavigationBar: BottomNavbar(ModalRoute.of(context).settings.arguments),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LoginForm(),
      ),
    );
  }
}
