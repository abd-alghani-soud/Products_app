import 'package:freezed_code/helper/api.dart';
import 'package:freezed_code/models/products_model.dart';

class GetAllProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    String uri = 'https://fakestoreapi.com/products';
    List<dynamic> data = await Api().get(
      uri: uri,
    );

    List<ProductsModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(
        ProductsModel.fromJson(data[i]),
      );
    }
    return products;
  }
}
