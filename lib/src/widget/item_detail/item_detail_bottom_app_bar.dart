import 'package:flutter/material.dart';
import '../../home_gift_theme.dart';

class ItemDetailBottomAppBar extends StatelessWidget {
    final addToCart;
    ItemDetailBottomAppBar(this.addToCart);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 14),
          splashColor: HomeGiftTheme.gradientFirstColor,
          textTheme: ButtonTextTheme.primary,
          color: HomeGiftTheme.secondayColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Add to Cart'),
              SizedBox(width: 10),
              Icon(Icons.chevron_right),
              Icon(Icons.add_shopping_cart),
            ],
          ),
          onPressed: () {
            addToCart();
          },
        ),
      ),
    );
  }
}
