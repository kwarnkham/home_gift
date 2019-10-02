class Image {
  int id;
  String name;
  int itemId;
  Image(json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'itemId': itemId,
      };
}
