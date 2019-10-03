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
    createdAt = DateTime.parse(json['created_at']).add(Duration(minutes:390));

    List<OrderItem> temp = [];
    for (int i = 0; i < json['items'].length; i++) {
      OrderItem item = OrderItem(json['items'][i]['pivot']);
      temp.add(item);
    }
    _items = temp;
  }

  List<OrderItem> get items => _items;
}

class OrderItem {
  int orderId;
  int itemId;
  String name;
  int quantity;
  int price;
  String description;
  String notice;
  double weight;
  int locationId;
  int merchantId;

  OrderItem(item) {
    orderId = item['order_id'];
    itemId = item['item_id'];
    name = item['name'];
    quantity = item['quantity'];
    price = item['price'];
    description = item['description'];
    notice = item['notice'];
    weight = item['weight'].toDouble();
    locationId = item['location_id'];
    merchantId = item['merchant_id'];
  }
}
