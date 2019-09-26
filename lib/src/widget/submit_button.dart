import 'package:flutter/material.dart';
import '../home_gift_theme.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final onPress;
  SubmitButton({
    @required this.label,
    @required this.onPress
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 17),
        splashColor: HomeGiftTheme.gradientFirstColor,
        textTheme: ButtonTextTheme.primary,
        color: HomeGiftTheme.secondayColor,
        child: Text(label),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}
