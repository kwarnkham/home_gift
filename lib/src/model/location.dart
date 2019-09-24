class Location {
  int id;
  String name;
  Location(json) {
    id = json['id'];
    if (json['name'] != null) {
      name = json['name'];
    }
  }
}
