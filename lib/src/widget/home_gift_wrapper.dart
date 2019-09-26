import 'package:flutter/material.dart';
import '../home_gift_theme.dart';

class HomeGiftWrapper extends StatelessWidget {
  final Widget child;
  HomeGiftWrapper({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HomeGiftTheme.gradientFirstColor,
            HomeGiftTheme.gradientSecondColor
          ],
          begin: HomeGiftTheme.gradientStart,
          end: HomeGiftTheme.graidentEnd,
        ),
      ),
    );
  }
}
