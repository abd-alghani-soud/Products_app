import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategoriesServices() async {
    String uri = 'https://fakestoreapi.com/products/categories';
    http.Response response = await http.get(Uri.parse(uri));
    List<dynamic> data = json.decode(response.body);
    return data;
  }
}
