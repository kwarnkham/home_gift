import 'package:flutter/material.dart';
import '../../appData.dart';
import '../../model/cart_item.dart';
import '../../bloc/cart_item_bloc.dart';

class AddedCartItems extends StatelessWidget {
  final List<CartItem> cartItem;
  AddedCartItems(this.cartItem);

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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/item_placeholder.png',
                  image: cartItem[index].item.images.length > 0
                      ? '${AppData.imageHost}/${cartItem[index].item.images[0].name}'
                      : '${AppData.imageHost}/item_placeholder.png',
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(cartItem[index].item.name),
                Text(
                    '${cartItem[index].item.price * cartItem[index].quantity} MMK'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(cartItem[index].item.description),
                Text(
                  'Unit Price: ${cartItem[index].item.price} MMK',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: cartItem[index].quantity > 1
                          ? () {
                              cartItemBloc.downQty(cartItem[index]);
                            }
                          : null,
                    ),
                    Text('Quantity: ${cartItem[index].quantity}'),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        cartItemBloc.upQty(cartItem[index]);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeCartItem(cartItem[index], context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
          ),
        ),
        childCount: cartItem.length,
      ),
    );
  }
}
