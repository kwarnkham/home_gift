import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  int id;
  String name;
  Location(this.id, this.name);
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
  
  // Location(json) {
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
