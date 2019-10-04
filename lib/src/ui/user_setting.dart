import 'package:flutter/material.dart';
import '../widget/home_gift_wrapper.dart';
import '../bloc/user_bloc.dart';
import '../app.dart';
import './home.dart';
import '../widget/auth_data.dart';

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
    final _apiToken = AuthData.of(context).user.apiToken;
    return Center(
      child: _apiToken != null
          ? isLoading
              ? CircularProgressIndicator()
              : RaisedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    userBloc.logout(_apiToken).then((_) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => App()),
                          ModalRoute.withName('/'));
                    });
                  },
                )
          : SizedBox(),
    );
  }
}
