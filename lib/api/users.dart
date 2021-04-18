import 'package:dio/dio.dart';
import 'package:flutter_example/models/user.dart';

class UsersAPI {
  UsersAPI._internal();

  static UsersAPI _instance = UsersAPI._internal();
  static UsersAPI get instance => _instance;

  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response = await this._dio.get(
          "https://reqres.in/api/users",
          queryParameters: {'page': page, 'delay': 4});

      return (response.data["data"] as List)
          .map((user) => User.fromJson(user))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
