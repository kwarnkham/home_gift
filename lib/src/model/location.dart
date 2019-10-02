class Location {
  int id;
  String name;
  Location(json) {
    id = json['id'];
    if (json['name'] != null) {
      name = json['name'];
    }
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
