import 'package:flutter/material.dart';
import 'package:home_gift/src/home_gift_theme.dart';
import 'package:badges/badges.dart';
import '../bloc/cart_item_bloc.dart';
import '../model/cart_item.dart';
import '../ui/cart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Fab extends StatefulWidget {
  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> {
  goToCartPage() async {
    final storage = new FlutterSecureStorage();
    String localToken = await storage.read(key: 'hGApiToken');
    print('localToken is $localToken');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
  }

  @override
  void initState() {
    cartItemBloc.getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: StreamBuilder<List<CartItem>>(
          stream: cartItemBloc.items,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int cartQuantity = 0;
              snapshot.data
                  .forEach((cartItem) => cartQuantity += cartItem.quantity);
              return Badge(
                showBadge: snapshot.data.length > 0 ? true : false,
                badgeContent: Text(cartQuantity.toString()),
                animationType: BadgeAnimationType.scale,
                badgeColor: HomeGiftTheme.infoColor,
                child: Icon(
                  Icons.shopping_cart,
                  size: 28,
                ),
              );
            }
            return Icon(Icons.shopping_cart);
          }),
      onPressed: () {
        goToCartPage();
      },
    );
  }
}
