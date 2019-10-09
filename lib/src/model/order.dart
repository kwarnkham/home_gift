import './order_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  int id;
  @JsonKey(name: 'user_id')
  int userId;
  @JsonKey(name: 'promotion_id')
  int promotionId;
  String name;
  String mobile;
  String address;
  String payment;
  @JsonKey(name: 'delivery_fees')
  int deliveryFees;
  int amount;
  String status;
  @JsonKey(name: 'c_name')
  String cNote;
  @JsonKey(name: 'a_note')
  String aNote;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  List<OrderItem> items = List();
  Order(
      this.id,
      this.userId,
      this.promotionId,
      this.name,
      this.mobile,
      this.address,
      this.payment,
      this.deliveryFees,
      this.amount,
      this.status,
      this.cNote,
      this.aNote,
      this.createdAt,
      this.items);
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
