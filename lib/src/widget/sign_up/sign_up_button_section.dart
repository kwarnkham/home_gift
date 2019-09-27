import 'package:flutter/material.dart';
import '../submit_button.dart';
import '../../ui/home.dart';

class SignUpButtonSection extends StatelessWidget {
  final submitSignUp;
  SignUpButtonSection(this.submitSignUp);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SubmitButton(
            label: 'Register',
            onPress: () {
              submitSignUp().then((user) {
                if (user.apiToken == null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sign Up Failed. Try using another phone number'),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {
                        },
                      ),
                    ),
                  );
                }
                if (user.apiToken != null) {
                  Navigator.of(context)
                      .pushReplacementNamed(Home.routeInfo['routeName']);
                }
              });
            }),
        FlatButton(
          textTheme: ButtonTextTheme.primary,
          child: Text('Login'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
