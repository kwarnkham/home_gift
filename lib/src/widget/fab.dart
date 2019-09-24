import 'package:flutter/material.dart';
import 'package:home_gift/src/home_gift_theme.dart';
import 'package:badges/badges.dart';

class Fab extends StatelessWidget {
  final List cartItem= List();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Badge(
          showBadge: cartItem.length > 0 ? true : false,
          badgeContent: Text(cartItem.length.toString()),
          animationType: BadgeAnimationType.scale,
          badgeColor: HomeGiftTheme.infoColor,
          child: Icon(Icons.shopping_cart),
        ),
        onPressed: () {},
      );
  }
}