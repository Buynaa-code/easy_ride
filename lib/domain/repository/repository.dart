import 'package:easy_ride/data/model/user.dart';

abstract class Repository {
  //Auth
  Future<User> getMeService();
  Future<String> login(
      String email, String password, String firebasetoken, String? tancode);
}
