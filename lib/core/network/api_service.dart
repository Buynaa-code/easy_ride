import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.get('MyApp.url$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> post(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.post('MyApp.url$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> put({required String endPoint}) async {
    var response = await _dio.put('MyApp.url$endPoint');
    return response;
  }

  Future<Response> delete({required String endPoint, dynamic params}) async {
    var response =
        await _dio.delete('MyApp.url$endPoint', queryParameters: params);
    return response;
  }
}
