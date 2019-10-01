import 'dart:convert';
import 'package:http/http.dart' as http;
import '../appData.dart';
import '../model/order.dart';
import '../model/user.dart';

class OrderApi {
  Future<List<Order>> getOrders(User user) async {
    String url = '/order/${user.id}';
    List<Order> orders = List();
    try {
      final response = await http.get(AppData.apiUrl + url, headers: {
        'Authorization': 'Bearer ${user.apiToken}',
        'Accept': 'application/json',
      });
      print(jsonDecode(response.body));
      // if (jsonDecode(response.body)['code'] == '0') {
      //   List jsonItems = jsonDecode(response.body)['result'];
      //   for (int i = 0; i < jsonItems.length; i++) {
      //     Order temp = Order(jsonItems[i]);
      //     orders.add(temp);
      //   }
      // }
      return orders;
    } catch (error) {
      throw error;
    }
  }
}
