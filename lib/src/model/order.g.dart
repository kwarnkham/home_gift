// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['id'] as int,
    json['user_id'] as int,
    json['promotion_id'] as int,
    json['name'] as String,
    json['mobile'] as String,
    json['address'] as String,
    json['payment'] as String,
    json['delivery_fees'] as int,
    json['amount'] as int,
    json['status'] as String,
    json['c_name'] as String,
    json['a_note'] as String,
    json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    (json['items'] as List)
        ?.map((e) =>
            e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'promotion_id': instance.promotionId,
      'name': instance.name,
      'mobile': instance.mobile,
      'address': instance.address,
      'payment': instance.payment,
      'delivery_fees': instance.deliveryFees,
      'amount': instance.amount,
      'status': instance.status,
      'c_name': instance.cNote,
      'a_note': instance.aNote,
      'created_at': instance.createdAt?.toIso8601String(),
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
