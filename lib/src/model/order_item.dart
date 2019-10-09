import './item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_item.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItem {
  @JsonKey(name: 'order_id')
  int orderId;
  int quantity;
  @JsonKey(name: 'item_id')
  int itemId;
  String name;
  int price;
  String description;
  String notice;
  double weight;
  @JsonKey(name: 'location_id')
  int locationId;
  @JsonKey(name: 'merchant_id')
  int merchantId;
  Item item;

  OrderItem(
    this.orderId,
    this.quantity,
    this.itemId,
    this.name,
    this.price,
    this.description,
    this.notice,
    this.weight,
    this.locationId,
    this.merchantId,
    this.item
  );
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json['pivot']);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
  // OrderItem(jsonOrderItem, jsonItem) {
  //   orderId = jsonOrderItem['order_id'];
  //   quantity = jsonOrderItem['quantity'];
  //   itemId = jsonOrderItem['item_id'];
  //   name = jsonOrderItem['name'];
  //   price = jsonOrderItem['price'];
  //   description = jsonOrderItem['description'];
  //   notice = jsonOrderItem['notice'];
  //   weight = jsonOrderItem['weight'].toDouble();
  //   locationId = jsonOrderItem['location_id'];
  //   merchantId = jsonOrderItem['merchant_id'];
  //   item = Item(jsonItem);
  // }
}
