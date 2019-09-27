import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';
import '../widget/sign_up/sign_up_button_section.dart';
import '../bloc/user_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword1 = true;
  bool hiddenPassword2 = true;
  String password;
  Map<String, dynamic> formData = Map();

  Future submitSignUp() async {
    setState(() {
      isLoading = true;
    });
    dynamic user;
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await userBloc
          .signUp(
        formData['name'],
        formData['mobile'],
        formData['address'],
        formData['password'],
        formData['passwordConfirmation'],
      )
          .then((value) {
        setState(() {
          isLoading = false;
        });
        user = value;
      });
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return HomeGiftWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              autovalidate: false,
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) {
                      formData['name'] = value;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      formData['address'] = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Address cannot be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      formData['mobile'] = value;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_iphone),
                        prefix: Text('09'),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number'),
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
                      formData['password'] = value;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: hiddenPassword1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        child: hiddenPassword1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onTap: () {
                          setState(() {
                            hiddenPassword1 = !hiddenPassword1;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      formData['passwordConfirmation'] = value;
                    },
                    obscureText: hiddenPassword2,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password Confirmation',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        child: hiddenPassword2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onTap: () {
                          setState(() {
                            hiddenPassword2 = !hiddenPassword2;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SignUpButtonSection(submitSignUp),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading ? LinearProgressIndicator() : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
