import 'package:easy_ride/core/app/constants.dart';
import 'package:easy_ride/core/network/api_service.dart';
import 'package:easy_ride/core/network/netword_info.dart';
import 'package:easy_ride/data/model/user.dart';
import 'package:easy_ride/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final NetworkInfo _networkInfo;
  final ApiService _apiService;

  RepositoryImpl(
    this._networkInfo,
    this._apiService,
  );

  //auth

  @override
  Future<User> getMeService() async {
    try {
      final response = await _apiService.get(endPoint: '/users/me');

      loggerPrettyNoStack.i("This is me service: $response");

      return User.fromJson(response.data['data']);
    } catch (error) {
      loggerPretty.e('Failed to fetch me service: $error');
      rethrow;
    }
  }

  @override
  Future<String> login(String email, String password, String firebasetoken,
      String? tancode) async {
    try {
      dynamic data = {
        'email': email,
        'password': password,
        'device_code': firebasetoken,
      };
      if (tancode != null && tancode.isNotEmpty) {
        data['tancode'] = tancode;
      }
      final response = await _apiService.post(
        endPoint: '/users/login',
        data: data,
      );
      loggerPrettyNoStack.i("This is token $response");
      if (response.data == 'DeviceNotFound') return response.data as String;
      // Assuming the API returns a token field
      final token = response.data['data']['token'] as String;
      loggerPrettyNoStack.i("This is token $token");
      return token;
    } catch (error) {
      loggerPretty.e('Login failed: $error');
      rethrow;
    }
  }
}
