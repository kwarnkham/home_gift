import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';

class CartAppBar extends StatelessWidget {
  final int cartQuantity;
  final int totalAmount;
  CartAppBar(this.cartQuantity,this.totalAmount);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.check_circle_outline),
      //     onPressed: () {
      //       showModalBottomSheet(
      //           backgroundColor: Colors.transparent,
      //           context: context,
      //           builder: (_) => ClipRRect(
      //                 borderRadius: BorderRadius.vertical(
      //                     top: Radius.circular(20)),
      //                 child: BottomSheet(
      //                   backgroundColor:
      //                       HomeGiftTheme.gradientFirstColor,
      //                   builder: (_) => Container(
      //                     height: 300,
      //                   ),
      //                   onClosing: () {},
      //                 ),
      //               ));
      //     },
      //     color: HomeGiftTheme.secondayColor,
      //   )
      // ],
      backgroundColor: HomeGiftTheme.gradientFirstColor,
      floating: true,
      expandedHeight: 100.0,
      title: Text('Total item item quantity: $cartQuantity'),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Total Amount: $totalAmount MMK',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ),
    );
  }
}
