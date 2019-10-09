import 'dart:convert';
import 'package:http/http.dart' as http;
import '../appData.dart';
import '../model/item.dart';


class ItemApi {
  Future<List<Item>> getItems() async {
    String url = '/items';
    List<Item> items = List();
    try {
      final response = await http.get(AppData.apiUrl + url);
      // print(response.body);
      if (jsonDecode(response.body)['code'] == '0') {
        List jsonItems = jsonDecode(response.body)['result'];
        for (int i = 0; i < jsonItems.length; i++) {
          Item temp = Item.fromJson(jsonItems[i]);
          items.add(temp);
        }
      }
      return items;
    } catch (error) {
      // print(error);
      throw error;
    }
  }
}
