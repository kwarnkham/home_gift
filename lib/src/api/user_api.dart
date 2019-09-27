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
    User user = User();
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

  Future<User> getAuthUser(token) async {
    String url = '/user';
    User user = User();
    try {
      final response = await http.get(AppData.apiUrl + url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      if (jsonDecode(response.body)['code'] == '0') {
        user = User(jsonDecode(response.body)['result']['user']);
        user.apiToken = token;
      }
      if (response.statusCode == 401) {
        await storage.delete(key: 'hGApiToken');
      }
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<User> login(mobile, password) async {
    String url = '/login';
    User user = User();
    try {
      final response = await http.post(AppData.apiUrl + url, body: {
        'mobile': mobile,
        'password': password,
      });
      // print(jsonDecode(response.body));

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

  Future<User> logout(token) async {
    String url = '/logout';
    User user = User();
    try {
      final response = await http.post(AppData.apiUrl + url, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      await storage.delete(key: 'hGApiToken');
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      // if (jsonDecode(response.body)['code'] == '0') {

      // }
      // if (response.statusCode == 401) {
      //   await storage.delete(key: 'hGApiToken');
      // }
      return user;
    } catch (error) {
      throw error;
    }
  }
}
