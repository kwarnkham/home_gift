import 'package:flutter/material.dart';
import '../home_gift_theme.dart';
import '../bloc/cart_item_bloc.dart';
import '../model/cart_item.dart';
import '../appData.dart';

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
                      SliverAppBar(
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.check_circle_outline),
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (_) => ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                        child: BottomSheet(
                                          backgroundColor:
                                              HomeGiftTheme.gradientFirstColor,
                                          builder: (_) => Container(
                                            height: 300,
                                          ),
                                          onClosing: () {},
                                        ),
                                      ));
                            },
                            color: HomeGiftTheme.secondayColor,
                          )
                        ],
                        backgroundColor: HomeGiftTheme.gradientFirstColor,
                        floating: true,
                        expandedHeight: 100.0,
                        title: Text('Total item item quantity: $cartQuantity'),
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            'Total Amount: $totalAmount MMK',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ),
                      ),
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
                                      '${snapshot.data[index].item.price * snapshot.data[index].quantity} MMK'),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data[index].item.description),
                                  Text(
                                    'Unit Price: ${snapshot.data[index].item.price} MMK',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('No item in cart'),
                        RaisedButton(
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                }
              }
              return SizedBox();
            }),
      ),
    );
  }
}
