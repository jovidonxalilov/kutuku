import 'package:kutuku/core/data/client.dart';
import 'package:kutuku/core/data/model/product_model.dart';

import '../model/user_mode.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductModel> product = [];
  List<UserModel> user = [];

  Future<List<ProductModel>> fetchProduct() async {
    final rawProduct = await client.fetchProduct();
    product = rawProduct.map((e) => ProductModel.fromJson(e),).toList();
    return product;
  }

  Future<List<UserModel>> fetchUser() async {
    final rawUser = await client.fetchUser();
    user = rawUser.map<UserModel>((e) => UserModel.fromJson(e),).toList();
    return user;
  }
}
