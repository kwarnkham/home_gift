import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  int id;
  String name;
  Category(this.id, this.name);
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
  // Category(json) {
  //   id = json['id'];
  //   name = json['name'];
  // }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //     };
}
