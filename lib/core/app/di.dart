import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:easy_ride/core/app/constants.dart';
import 'package:easy_ride/core/network/api_service.dart';
import 'package:easy_ride/core/network/dio_factory.dart';
import 'package:easy_ride/core/network/netword_info.dart';
import 'package:easy_ride/data/repository/repository_impl.dart';
import 'package:easy_ride/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // AppPreferences instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //NetworkInfo instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  const storage = FlutterSecureStorage();

  final token =
      await storage.read(key: 'token', aOptions: Constants.androidOptions);

  //DioFactory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(token ?? ''));

  final dio = await instance<DioFactory>().getDio();

  //AppServiceClient instance
  instance.registerLazySingleton(() => ApiService(dio));

  instance.registerFactory<Repository>(
      () => RepositoryImpl(instance(), instance()));
}
