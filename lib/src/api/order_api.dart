import 'dart:convert';
import 'package:http/http.dart' as http;
import '../appData.dart';
import '../model/order.dart';
import '../model/user.dart';
import '../model/cart_item.dart';

class OrderApi {
  Future<List<Order>> getOrders(User user) async {
    String url = '/order/user';
    List<Order> orders = List();
    try {
      final response = await http.get(AppData.apiUrl + url, headers: {
        'Authorization': 'Bearer ${user.apiToken}',
        'Accept': 'application/json',
      });
      
      if (jsonDecode(response.body)['code'] == '0') {
        List jsonOrders = jsonDecode(response.body)['result']['data'];
        for (int i = 0; i < jsonOrders.length; i++) {
          Order temp = Order.fromJson(jsonOrders[i]);
          orders.add(temp);
        }
      }
      // print(orders[0].items[0].name);
      return orders;
    } catch (error) {
      throw error;
    }
  }

  Future<List<Order>> submitOrder(
    Map<String, dynamic> orderInfo,
    List<CartItem> items,
    User user,
  ) async {
    String url = '/order';
    List<Order> orders = List();
    int totalAmount = 0;
    items.forEach(
        (cartItem) => totalAmount += cartItem.quantity * cartItem.item.price);
    Map<String, dynamic> body = {
      'name': orderInfo['name'],
      'mobile': orderInfo['mobile'],
      'address': orderInfo['address'],
      'payment': orderInfo['payment'],
      'amount': totalAmount.toString(),
      'delivery_fees': AppData.deliveryFees.toString(),
      'c_note': orderInfo['note'],
      'items': jsonEncode(items)
    };
    if (orderInfo['note'] == null) {
      body.remove('c_note');
    }

    try {
      final response =
          await http.post(AppData.apiUrl + url, body: body, headers: {
        'Authorization': 'Bearer ${user.apiToken}',
        'Accept': 'application/json',
      });
      print(jsonDecode(response.body));
      // if (jsonDecode(response.body)['code'] == '0') {
      //   List jsonOrders = jsonDecode(response.body)['result'];
      //   for (int i = 0; i < jsonOrders.length; i++) {
      //     Order temp = Order(jsonOrders[i]);
      //     orders.add(temp);
      //   }
      // }

      return orders;
    } catch (error) {
      throw error;
    }
  }
}
