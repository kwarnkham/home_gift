import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable(explicitToJson: true)
class Image {
  int id;
  String name;
  @JsonKey(name: 'item_id')
  int itemId;
  Image(this.id, this.name, this.itemId);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
