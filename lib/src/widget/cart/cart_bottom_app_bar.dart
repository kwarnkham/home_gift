import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';
import '../../ui/make_order.dart';
import '../../model/user.dart';
import '../../ui/login.dart';
import '../../bloc/user_bloc.dart';
import '../home_gift_wrapper.dart';

class CartBottomAppBar extends StatelessWidget {
  goToMakeOrder(context, User user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MakeOrder(user)));
  }

  @override
  Widget build(BuildContext context) {
    userBloc.getAppUser();
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: StreamBuilder<User>(
            stream: userBloc.user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  splashColor: HomeGiftTheme.gradientFirstColor,
                  textTheme: ButtonTextTheme.primary,
                  color: HomeGiftTheme.secondayColor,
                  child: Text('Make Order'),
                  onPressed: () {
                    if (snapshot.data.apiToken != null) {
                      goToMakeOrder(context, snapshot.data);
                    }
                    if (snapshot.data.apiToken == null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => HomeGiftWrapper(child: Login())));
                    }
                  },
                );
              }
              return SizedBox();
            }),
      ),
    );
  }
}
