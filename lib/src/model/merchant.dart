class Merchant {
  int id;
  String name;
  Merchant(json) {
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
