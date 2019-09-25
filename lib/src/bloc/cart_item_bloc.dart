import 'dart:async';
import '../model/cart_item.dart';

class CartItemBloc {
  final StreamController<List<CartItem>> _controller =
      StreamController<List<CartItem>>.broadcast();
  List<CartItem> _cartItems = List();
  Stream<List<CartItem>> get items => _controller.stream;

  addToCart(List<CartItem> items) {
    _cartItems = items;
    _controller.sink.add(items);
  }

  Future getCartItems() async {
    await Future.delayed(
      Duration(milliseconds: 1),
      () => _controller.sink.add(_cartItems),
    );
  }

  dispose() {
    _controller.close();
  }
}

final cartItemBloc = CartItemBloc();
