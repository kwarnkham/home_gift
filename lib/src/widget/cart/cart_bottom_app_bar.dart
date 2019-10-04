import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';
import '../../ui/make_order.dart';
import '../../model/user.dart';
import '../../ui/login.dart';
import '../home_gift_wrapper.dart';
import '../auth_data.dart';

class CartBottomAppBar extends StatelessWidget {
  goToMakeOrder(context, User user) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MakeOrder(user)));
  }

  @override
  Widget build(BuildContext context) {
    final _user = AuthData.of(context).user;
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 17),
          splashColor: HomeGiftTheme.gradientFirstColor,
          textTheme: ButtonTextTheme.primary,
          color: HomeGiftTheme.secondayColor,
          child: Text('Make Order'),
          onPressed: () {
            if (_user.apiToken != null) {
              goToMakeOrder(context, _user);
            }
            if (_user.apiToken == null) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => HomeGiftWrapper(child: Login())));
            }
          },
        ),
      ),
    );
  }
}
