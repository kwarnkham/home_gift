import './item.dart';

class Order {
  int id;
  int userId;
  int promotionId;
  String name;
  String mobile;
  String address;
  String payment;
  int deliveryFees;
  int amount;
  String status;
  String cNote;
  String aNote;
  DateTime createdAt;
  List<OrderItem> _items = List();

  Order(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    promotionId = json['promotion_id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    payment = json['payment'];
    deliveryFees = json['delivery_fees'];
    amount = json['amount'];
    status = json['status'];
    cNote = json['c_note'];
    aNote = json['a_note'];
    createdAt = DateTime.parse(json['created_at']).add(Duration(minutes: 390));

    List<OrderItem> temp = [];
    for (int i = 0; i < json['items'].length; i++) {
      OrderItem item = OrderItem(json['items'][i]['pivot'], json['items'][i]);
      temp.add(item);
    }
    _items = temp;
  }

  List<OrderItem> get items => _items;
}

class OrderItem {
  int orderId;
  int quantity;
  int itemId;
  String name;
  int price;
  String description;
  String notice;
  double weight;
  int locationId;
  int merchantId;
  Item item;
  OrderItem(jsonOrderItem, jsonItem) {
    orderId = jsonOrderItem['order_id'];
    quantity = jsonOrderItem['quantity'];
    itemId = jsonOrderItem['item_id'];
    name = jsonOrderItem['name'];
    price = jsonOrderItem['price'];
    description = jsonOrderItem['description'];
    notice = jsonOrderItem['notice'];
    weight = jsonOrderItem['weight'].toDouble();
    locationId = jsonOrderItem['location_id'];
    merchantId = jsonOrderItem['merchant_id'];
    item = Item(jsonItem);
  }
}
