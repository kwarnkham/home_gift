import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../bloc/cart_item_bloc.dart';
import '../model/cart_item.dart';
import '../widget/cart/added_cart_items.dart';
import '../widget/cart/cart_bottom_app_bar.dart';
import '../widget/cart/cart_app_bar.dart';
import '../widget/cart/no_item_in_cart.dart';


class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cartItemBloc.getCartItems();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: HomeGiftTheme.gradientStart,
            end: HomeGiftTheme.graidentEnd,
            colors: [
              HomeGiftTheme.gradientFirstColor,
              HomeGiftTheme.gradientSecondColor
            ]),
      ),
      child: Scaffold(
        bottomNavigationBar: StreamBuilder<List<CartItem>>(
            stream: cartItemBloc.items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length>0 ?CartBottomAppBar() : SizedBox();
              }
              return SizedBox();
            }),
        body: StreamBuilder<List<CartItem>>(
            stream: cartItemBloc.items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int cartQuantity = 0;
                int totalAmount = 0;
                snapshot.data
                    .forEach((cartItem) => cartQuantity += cartItem.quantity);
                snapshot.data.forEach((cartItem) =>
                    totalAmount += cartItem.quantity * cartItem.item.price);
                if (snapshot.data.length > 0) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      CartAppBar(cartQuantity, totalAmount),
                      AddedCartItems(snapshot.data),
                    ],
                  );
                }
                if (snapshot.data.length <= 0) {
                  return NoItemInCart();
                }
              }
              return SizedBox();
            }),
      ),
    );
  }
}
