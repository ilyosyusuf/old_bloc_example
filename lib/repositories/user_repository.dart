import 'package:dio/dio.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._init();
  static UserRepository get instance => _instance;
  UserRepository._init();

  Future getUsers()async {

    try {
      Response data = await Dio().get("https://jsonplaceholder.typicode.com/users");
      // users = data;
      return data;
    } catch (e) {
      print(e);
    }
  }
}