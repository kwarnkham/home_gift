import 'dart:convert';
import 'package:http/http.dart' as http;
import '../appData.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../model/user.dart';

class UserApi {
  final storage = new FlutterSecureStorage();

  Future<User> signUp(
      name, mobile, address, password, passwordConfirmation) async {
    String url = '/user';
    User user;
    try {
      final response = await http.post(AppData.apiUrl + url, body: {
        'name': name,
        'mobile': mobile,
        'address': address,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      if (jsonDecode(response.body)['code'] == '0') {
        user = User(jsonDecode(response.body)['result']['user']);
        user.apiToken = jsonDecode(response.body)['result']['token'];
        await storage.write(key: 'hGApiToken', value: user.apiToken);
      }
      return user;
    } catch (error) {
      throw error;
    }
  }
}
