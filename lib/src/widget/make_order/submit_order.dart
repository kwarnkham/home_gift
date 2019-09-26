import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';

class SubmitOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 17),
            splashColor: HomeGiftTheme.gradientFirstColor,
            textTheme: ButtonTextTheme.primary,
            color: HomeGiftTheme.secondayColor,
            child: Text('Send Order'),
            onPressed: () {
              // goToMakeOrder(context);
            },
          ),
        )
      ],
    );
  }
}
