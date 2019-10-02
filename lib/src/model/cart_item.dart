import './item.dart';

class CartItem {
  Item item;
  int quantity;
  CartItem(this.item, this.quantity);

  Map<String, dynamic> toJson() => {
        'item': item,
        'quantity': quantity,
      };
}
