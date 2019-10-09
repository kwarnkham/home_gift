import 'package:json_annotation/json_annotation.dart';
part 'merchant.g.dart';

@JsonSerializable(explicitToJson: true)
class Merchant {
  int id;
  String name;
  Merchant(this.id, this.name);
  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
  // Merchant(json) {
  //   id = json['id'];
  //   if (json['name'] != null) {
  //     name = json['name'];
  //   }
  // }
  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //     };
}
