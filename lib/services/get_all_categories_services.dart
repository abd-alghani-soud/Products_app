import 'package:freezed_code/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategoriesServices() async {
    String uri = 'https://fakestoreapi.com/products/categories';
    List<dynamic> data = await Api().get(uri: uri);
    return data;
  }
}
