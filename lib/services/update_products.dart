import 'package:freezed_code/helper/api.dart';
import 'package:freezed_code/models/products_model.dart';

class UpdateProducts {
  Future<ProductsModel> updateProducts({
    required String title,
    required String image,
    required String price,
    required String desc,
    required String category,
    required dynamic id,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });

    return ProductsModel.fromJson(data);
  }
}
