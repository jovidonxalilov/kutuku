import 'package:dio/dio.dart';

import '../utils/custom_exception.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

  Future<List<dynamic>> fetchProduct() async {
    print("📤 So‘rov yuborilmoqda: /products");
    final response = await dio.get("/products");

    print("📥 Javob keldi: ${response.statusCode}");
    print("📦 Body: ${response.data}");

    if (response.statusCode == 200) {
      final List<dynamic> products = List.from(response.data); // <-- bu joy to'g'ri
      print("✅ Ma'lumot listga o‘tkazildi: ${products.length} ta element");
      return products;
    } else {
      print("❌ Status code: ${response.statusCode}");
      throw CustomException(message: "Ma'lumot kelmadi");
    }
  }


}
