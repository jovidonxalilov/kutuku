import 'package:dio/dio.dart';

import '../utils/custom_exception.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

  Future<List<dynamic>> fetchProduct() async {
    final response = await dio.get("/products");
    if (response.statusCode == 200) {
      final List<dynamic> products = List.from(response.data);
      return products;
    } else {
      throw CustomException(message: "Ma'lumot kelmadi");
    }
  }

  Future<List<dynamic>> fetchUser() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request started');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response received');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        print('Error occurred: ${error.message}');
        return handler.next(error);
      },
    ));

    try {
      final response = await dio.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> users = List.from(response.data);
        return users;
      } else {
        throw CustomException(message: "Ma'lumot kelmadi");
      }
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      throw CustomException(message: "Xatolik yuz berdi: ${e.message}");
    } catch (e) {
      print("Unknown error: $e");
      throw CustomException(message: "Nomaʼlum xatolik: $e");
    }
  }
}
