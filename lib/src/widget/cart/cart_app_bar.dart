import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';
import '../../appData.dart';

class CartAppBar extends StatelessWidget {
  final int cartQuantity;
  final int totalAmount;
  CartAppBar(this.cartQuantity, this.totalAmount);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: HomeGiftTheme.gradientFirstColor,
      floating: true,
      expandedHeight: 100.0,
      title: FittedBox(
          child: Text('Quantity: $cartQuantity | Amount: $totalAmount MMK')),
      flexibleSpace: FlexibleSpaceBar(
        title: FittedBox(
          child: Text(
            'Delivery: ${AppData.deliveryFees} MMK | Total: ${totalAmount + AppData.deliveryFees} MMK',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
          ),
        ),
      ),
    );
  }
}
