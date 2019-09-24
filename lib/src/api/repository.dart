import './item_api.dart';
import '../model/item.dart';

class Repository {
  final _itemApi = ItemApi();
  Future<List<Item>> getItems() => _itemApi.getItems();
}
