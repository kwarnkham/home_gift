import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';
import '../../ui/make_order.dart';

class CartBottomAppBar extends StatelessWidget {
  goToMakeOrder(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MakeOrder()));
  }

  @override
  Widget build(BuildContext context) {
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
            goToMakeOrder(context);
          },
        ),
      ),
    );
  }
}
