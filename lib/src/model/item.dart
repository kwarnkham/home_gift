import './merchant.dart';
import './category.dart';
import './image.dart';
import './location.dart';
import 'dart:convert';

class Item {
  int id;
  String name;
  int price;
  String description;
  String notice;
  double weight;
  List<Category> categories;
  List<Image> images;
  Location location;
  Merchant merchant;

  Item([json]) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      price = json['price'];
      description = json['description'];
      notice = json['notice'];
      weight = json['weight'].toDouble();
      List<Category> tempCategories = List();
      for (int i = 0; i < json['categories'].length; i++) {
        var category = Category(json['categories'][i]);
        tempCategories.add(category);
      }
      categories = tempCategories;
      List<Image> tempImages = List();
      for (int i = 0; i < json['images'].length; i++) {
        var image = Image(json['images'][i]);
        tempImages.add(image);
      }
      images = tempImages;
      location = Location(json['location']);
      merchant = Merchant(json['merchant']);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'notice': notice,
        'weight': weight,
        'categories': categories,
        'images': images,
        'location': location,
        'merchant': merchant
      };
}
