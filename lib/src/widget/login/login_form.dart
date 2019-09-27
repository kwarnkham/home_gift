import 'package:flutter/material.dart';
import '../../bloc/user_bloc.dart';
import '../../ui/home.dart';
import '../../widget/submit_button.dart';
import '../../ui/sign_up.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hiddenPassword = true;
  Map<String, dynamic> inputData = Map();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future submitLogin(context) async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState.save();
      await userBloc
          .login(inputData['mobile'], inputData['password'])
          .then((value) {
        if (value.apiToken == null) {
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Information is incorrect'),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {},
              ),
            ),
          );
        }
        if (value.apiToken != null) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          if (!Navigator.of(context).canPop()) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Home.routeInfo['routeName'], ModalRoute.withName('/'));
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: false,
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (value) {
              inputData['mobile'] = value;
            },
            autofocus: false,
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
            onSaved: (value) {
              inputData['password'] = value;
            },
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
                onPressed: submitLogin,
                label: 'Login',
              ),
              FlatButton(
                textTheme: ButtonTextTheme.primary,
                child: Text('Sign Up'),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) => SignUp()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
