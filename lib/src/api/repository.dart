import './item_api.dart';
import '../model/item.dart';
import './user_api.dart';
import '../model/user.dart';

class Repository {
  final _itemApi = ItemApi();
  final _userApi =UserApi();

  Future<List<Item>> getItems() => _itemApi.getItems();
  Future<User> signUp(name, mobile, address, password, passwordConfirmation) => _userApi.signUp(name, mobile, address, password, passwordConfirmation);
  Future<User> getAuthUser(token) => _userApi.getAuthUser(token);
}
