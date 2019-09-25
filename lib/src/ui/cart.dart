import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../bloc/cart_item_bloc.dart';
import '../model/cart_item.dart';
import '../appData.dart';
import 'package:badges/badges.dart';
import '../home_gift_theme.dart';

class Cart extends StatelessWidget {
  removeCartItem(CartItem item, context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Confirm Delete'),
              actions: <Widget>[
                RaisedButton(
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    cartItemBloc.remove(item);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

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
        appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: StreamBuilder<List<CartItem>>(
                  stream: cartItemBloc.items,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int cartQuantity = 0;
                      snapshot.data.forEach(
                          (cartItem) => cartQuantity += cartItem.quantity);
                      return Badge(
                        showBadge: snapshot.data.length > 0 ? true : false,
                        badgeContent: Text(cartQuantity.toString()),
                        animationType: BadgeAnimationType.scale,
                        badgeColor: HomeGiftTheme.infoColor,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40,
                          color: HomeGiftTheme.secondayColor,
                        ),
                      );
                    }
                    return Icon(
                      Icons.shopping_cart,
                      size: 28,
                    );
                  }),
            )
          ],
        ),
        body: StreamBuilder<List<CartItem>>(
            stream: cartItemBloc.items,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/item_placeholder.png',
                                    image: snapshot.data[index].item.images
                                                .length >
                                            0
                                        ? '${AppData.imageHost}/${snapshot.data[index].item.images[0].name}'
                                        : '${AppData.imageHost}/item_placeholder.png',
                                  ),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(snapshot.data[index].item.name),
                                  Text(
                                      '${snapshot.data[index].item.price.toString()} MMK'),
                                ],
                              ),
                              subtitle: Column(
                                children: <Widget>[
                                  Text(snapshot.data[index].item.description),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        onPressed:
                                            snapshot.data[index].quantity > 1
                                                ? () {
                                                    cartItemBloc.downQty(
                                                        snapshot.data[index]);
                                                  }
                                                : null,
                                      ),
                                      Text(
                                          'Quantity: ${snapshot.data[index].quantity}'),
                                      IconButton(
                                        icon: Icon(Icons.keyboard_arrow_up),
                                        onPressed: () {
                                          cartItemBloc
                                              .upQty(snapshot.data[index]);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          removeCartItem(
                                              snapshot.data[index], context);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                            ),
                          ),
                          childCount: snapshot.data.length,
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.data.length <= 0) {
                  return Center(child: Text('No items in cart'));
                }
              }
              return SizedBox();
            }),
      ),
    );
  }
}
