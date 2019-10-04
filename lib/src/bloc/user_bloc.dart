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

  Future getAppUser() async {
    print('get app');
    await Future.delayed(
      Duration(milliseconds: 1),
      () => _controller.sink.add(appUser),
    );
  }

  // Future getItems() async {
  //   List<User> items = await _repository.getItems();
  //   if (!_controller.isClosed) {
  //     _controller.sink.add(items);
  //   }
  // }

  Future<User> signUp(name, mobile, address, password, passwordConfirmation) async {
    appUser = await _repository.signUp(
        name, mobile, address, password, passwordConfirmation);
    _controller.sink.add(appUser);
    return appUser;
  }

  Future<User> getAuthUser(token) async{
    print('get auth');
    appUser = await _repository.getAuthUser(token);
    _controller.sink.add(appUser);
    return appUser;
  }

  Future<User> login(mobile, password) async{
    appUser = await _repository.login(mobile, password);
    _controller.sink.add(appUser);
    return appUser;
  }

  Future<User> logout(token) async{
    appUser = await _repository.logout(token);
    _controller.sink.add(appUser);
    return appUser;
  }

  dispose() {
    _controller.close();
  }
}

final userBloc = UserBloc();
