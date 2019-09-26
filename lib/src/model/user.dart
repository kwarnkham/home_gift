class User {
  int id;
  String name;
  String mobile;
  String address;
  String apiToken;

  User([json]) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      mobile = json['mobile'];
      address = json['address'];
    }
  }
}