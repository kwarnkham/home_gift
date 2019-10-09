// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    json['order_id'] as int,
    json['quantity'] as int,
    json['item_id'] as int,
    json['name'] as String,
    json['price'] as int,
    json['description'] as String,
    json['notice'] as String,
    (json['weight'] as num)?.toDouble(),
    json['location_id'] as int,
    json['merchant_id'] as int,
    json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'quantity': instance.quantity,
      'item_id': instance.itemId,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'notice': instance.notice,
      'weight': instance.weight,
      'location_id': instance.locationId,
      'merchant_id': instance.merchantId,
      'item': instance.item?.toJson(),
    };
