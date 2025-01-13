import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/services/update_products.dart';
import 'package:hive/hive.dart';

part 'update_products_state.dart';
class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  UpdateProductsCubit() : super(UpdateProductsInitial());

  String? title, price, image, description, category;

  Future<void> loadSavedData() async {
    final box = Hive.box('productsBox');
    final product = box.get('product');
    if (product != null) {
      title = product['title'];
      price = product['price'];
      image = product['image'];
      description = product['description'];
      category = product['category'];
    }
    emit(UpdateProductsLoadedState(title, price, image, description));
  }

  Future<void> updateProducts(ProductsModel products) async {
    emit(UpdateProductsLoadingState());

    try {
      // Call update service
      await UpdateProducts().updateProducts(
        id: products.id,
        title: title ?? products.title,
        image: image ?? products.image,
        price: price ?? products.price.toString(),
        desc: description ?? products.description,
        category: category ?? products.category,
      );

      // بعد التحديث، احفظ البيانات المحدثة في Hive
      final box = Hive.box('productsBox');
      box.put('product', {
        'title': title ?? products.title,
        'price': price ?? products.price.toString(),
        'image': image ?? products.image,
        'description': description ?? products.description,
        'category': category ?? products.category,
      });

      emit(UpdateProductsSuccessState());
    } catch (e) {
      emit(UpdateProductsFailureState(e.toString()));
    } finally {
      emit(UpdateProductsLoadedState(title, price, image, description));
    }
  }

  void reloadProducts() {
    emit(UpdateProductsLoadedState(title, price, image, description));
    loadSavedData();  // إعادة تحميل البيانات من Hive
  }
}
