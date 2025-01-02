import 'dart:convert';

import 'package:freezed_code/models/products_model.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  Future<List<ProductsModel>> getCategoriesProducts(
      {required String productsName}) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$productsName'),
      );
      List<ProductsModel> products = (json.decode(response.body))
          .map<ProductsModel>((jsonData) => ProductsModel.fromJson(jsonData))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
