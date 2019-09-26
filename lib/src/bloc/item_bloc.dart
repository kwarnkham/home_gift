import 'dart:async';
import '../api/repository.dart';
import '../model/item.dart';

class ItemBloc {
  final _repository = Repository();
  final StreamController<List<Item>> _controller =
      StreamController<List<Item>>.broadcast();

  Stream<List<Item>> get items => _controller.stream;

  Future getItems() async {
    List<Item> items = await _repository.getItems();
    if (!_controller.isClosed) {
      _controller.sink.add(items);
    }
  }

  dispose() {
    _controller.close();
  }
}

// final itemBloc = ItemBloc();
