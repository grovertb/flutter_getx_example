import 'package:flutter_example/api/users.dart';
import 'package:flutter_example/models/user.dart';
import 'package:flutter_example/pages/profilePage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print("HomeController: onInit");
  }

  @override
  void onReady() {
    super.onReady();
    print("HomeController: onReady");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text']);
  }

  Future<void> showUserProfile(User user) async {
    final result = await Get.to<String>(ProfilePage(), arguments: user);

    if (result != null) {
      print("Result: $result");
    }
  }
}
