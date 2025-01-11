import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/models/products_model.dart';
import 'package:freezed_code/services/update_products.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'update_products_state.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  UpdateProductsCubit() : super(UpdateProductsInitial());

  String? title, price, image, description;
  bool isLoading = false;

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    title = prefs.getString('title');
    price = prefs.getString('price');
    image = prefs.getString('image');
    description = prefs.getString('description');
    emit(UpdateProductsLoadedState(title, price, image, description));
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('title', title ?? '');
    await prefs.setString('price', price ?? '');
    await prefs.setString('image', image ?? '');
    await prefs.setString('description', description ?? '');
  }

  Future<void> updateProducts(ProductsModel products) async {
    isLoading = true;
    emit(UpdateProductsLoadingState());

    try {
      await UpdateProducts().updateProducts(
        id: products.id,
        title: title ?? products.title,
        image: image ?? products.image,
        price: price ?? products.price.toString(),
        desc: description ?? products.description,
        category: products.category,
      );
      await saveData();
      emit(UpdateProductsSuccessState());
    } catch (e) {
      emit(UpdateProductsFailureState(e.toString()));
    } finally {
      isLoading = false;
      emit(UpdateProductsLoadedState(title, price, image, description));
    }
  }
}