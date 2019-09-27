import 'package:flutter/material.dart';
import '../widget/bottom_navbar.dart';
import '../widget/submit_button.dart';
import './sign_up.dart';

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
  GlobalKey _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      bottomNavigationBar: BottomNavbar(index: 2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          autovalidate: false,
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  prefix: Text('09'),
                  prefixIcon: Icon(Icons.phone_iphone),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone Number cannot be empty';
                  }
                  if (int.tryParse(value) == null ||
                      int.parse(value) < 0 ||
                      value.length < 7 ||
                      value.length > 9) {
                    return 'Enter real Phone Number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: hiddenPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key),
                  suffixIcon: GestureDetector(
                    child: hiddenPassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onTap: () {
                      setState(() {
                        hiddenPassword = !hiddenPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SubmitButton(
                    label: 'Login',
                    onPress: () {},
                  ),
                  FlatButton(
                    textTheme: ButtonTextTheme.primary,
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => SignUp()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
