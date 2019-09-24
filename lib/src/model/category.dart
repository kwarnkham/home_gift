class Category {
  int id;
  String name;
  Category(json) {
    id = json['id'];
    name = json['name'];
  }
}
