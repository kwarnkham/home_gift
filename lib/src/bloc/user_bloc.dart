import 'dart:async';
import '../api/repository.dart';
import '../model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserBloc {
  final _repository = Repository();
  final StreamController<User> _controller = StreamController<User>.broadcast();

  Stream<User> get user => _controller.stream;
  final storage = new FlutterSecureStorage();
  User appUser = User();

  // Future getUser() async {
  //   await Future.delayed(
  //     Duration(milliseconds: 1),
  //     () => _controller.sink.add(appUser),
  //   );
  // }

  // Future getItems() async {
  //   List<User> items = await _repository.getItems();
  //   if (!_controller.isClosed) {
  //     _controller.sink.add(items);
  //   }
  // }

  Future signUp(name, mobile, address, password, passwordConfirmation) async {
    final user = await _repository.signUp(
        name, mobile, address, password, passwordConfirmation);
    _controller.sink.add(user);
    return user;
  }

  dispose() {
    _controller.close();
  }
}

final userBloc = UserBloc();