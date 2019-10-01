import 'dart:async';
import '../api/repository.dart';
import '../model/order.dart';

class OrderBloc {
  final _repository = Repository();
  final StreamController<List<Order>> _controller =
      StreamController<List<Order>>.broadcast();

  Stream<List<Order>> get orders => _controller.stream;

  Future getOrders(user) async {
    List<Order> items = await _repository.getOrders(user);
    if (!_controller.isClosed) {
      _controller.sink.add(items);
    }
  }

  dispose() {
    _controller.close();
  }
}

// final itemBloc = ItemBloc();
