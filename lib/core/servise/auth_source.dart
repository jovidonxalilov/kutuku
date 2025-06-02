import 'package:dio/dio.dart';
import '../data/model/auth_model.dart';
class AuthDatasource {

  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://fakestoreapi.com",
    // headers: {
    //   "Content-Type": "application/json",
    // },
  ));


  Future<AuthModel> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final data = {
        "email": email,
        "password": password,
        "username": username,
      };

      final response = await dio.post("/users", data: data);
      final decodeData = response.data;

      if (decodeData["error"] != null) {
        throw Exception(decodeData["error"]["message"]);
      }

      final authModel = AuthModel.fromJson(decodeData);

      return authModel;
    } catch (e) {
      print("Register error: $e");
      rethrow;
    }
  }


  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      };

      final response = await dio.post(
        "/accounts:signInWithPassword",
        // queryParameters: {"key": _myApiKey},
        data: data,
      );

      final decodeData = response.data;

      if (decodeData["error"] != null) {
        throw Exception(decodeData["error"]["message"]);
      }

      final authModel = AuthModel.fromJson(decodeData);

      return authModel;
    } catch (e) {
      print("Login error: $e");
      rethrow;
    }
  }


}
