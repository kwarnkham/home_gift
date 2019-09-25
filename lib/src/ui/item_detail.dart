import 'package:flutter/material.dart';
import 'package:home_gift/src/bloc/cart_item_bloc.dart';
import '../home_gift_theme.dart';
import '../model/item.dart';
import '../widget/item_detail/item_detail_pictures.dart';
import '../widget/item_detail/item_detail_quantity.dart';
import '../model/cart_item.dart';
import 'package:badges/badges.dart';

class ItemDetail extends StatefulWidget {
  final Item item;
  ItemDetail({this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int quantity;
  List<CartItem> cartItems;
  upQty() {
    setState(() {
      quantity++;
    });
  }

  downQty() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  addToCart() {
    CartItem cartItem = CartItem(widget.item, quantity);
    if (cartItems.any((el) => el.item.name == cartItem.item.name)) {
      cartItems.firstWhere((el)=>el.item.name == cartItem.item.name).quantity += cartItem.quantity;
    }
    if (!cartItems.any((el) => el.item.name == cartItem.item.name)) {
      cartItems.add(cartItem);
    }
    
    cartItemBloc.addToCart(cartItems);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    quantity = 1;
    cartItemBloc.items.listen((items) {
      cartItems = items;
    });
    cartItemBloc.getCartItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.item.name),
          actions: <Widget>[
            IconButton(
              iconSize: 40,
              icon: StreamBuilder<List<CartItem>>(
                  stream: cartItemBloc.items,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      int cartQuantity = 0;
                      snapshot.data.forEach(
                          (cartItem) => cartQuantity += cartItem.quantity);
                      return Badge(
                        showBadge: snapshot.data.length > 0 ? true : false,
                        badgeContent: Text(cartQuantity.toString()),
                        animationDuration: Duration(milliseconds: 100),
                        animationType: BadgeAnimationType.scale,
                        badgeColor: HomeGiftTheme.infoColor,
                        child: Icon(Icons.shopping_cart),
                      );
                    }
                    return Icon(Icons.shopping_cart);
                  }),
              onPressed: () {},
              color: HomeGiftTheme.secondayColor,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ItemDetailPictures(widget.item),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.item.price.toString()),
                    Text('${widget.item.weight} kg'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.item.merchant.name),
                    Text(widget.item.location.name),
                  ],
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 30),
                ),
                Text(widget.item.description),
                Text(
                  'Notice',
                  style: TextStyle(fontSize: 25),
                ),
                Text(widget.item.notice),
                SizedBox(
                  height: 20,
                ),
                ItemDetailQuantity(quantity, upQty, downQty),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: HomeGiftTheme.primaryColor,
                      child: Row(
                        children: <Widget>[
                          Text('Add to cart'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.add_shopping_cart),
                        ],
                      ),
                      onPressed: () {
                        addToCart();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
