class Merchant {
  int id;
  String name;
  Merchant(json) {
    id = json['id'];
    if (json['name'] != null) {
      name = json['name'];
    }
  }
}
