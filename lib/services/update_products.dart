import 'package:freezed_code/helper/api.dart';
import 'package:freezed_code/models/products_model.dart';

class AddProducts {
  Future<ProductsModel> addProducts({
    required String title,
    required String image,
    required String price,
    required String desc,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });

    return ProductsModel.fromJson(data);
  }
}
