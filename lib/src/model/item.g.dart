// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['id'] as int,
    json['name'] as String,
    json['price'] as int,
    json['description'] as String,
    json['notice'] as String,
    (json['weight'] as num)?.toDouble(),
    (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    json['merchant'] == null
        ? null
        : Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'notice': instance.notice,
      'weight': instance.weight,
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
      'images': instance.images?.map((e) => e?.toJson())?.toList(),
      'location': instance.location?.toJson(),
      'merchant': instance.merchant?.toJson(),
    };
