import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_code/models/products_model.dart';

class FavoritesCubit extends Cubit<List<ProductsModel>> {
  FavoritesCubit() : super([]);

  void addToFavorites(ProductsModel product) {
    if (!state.any((item) => item.id == product.id)) {
      emit([...state, product]);
    }
  }

  void removeFromFavorites(ProductsModel product) {
    emit(state.where((item) => item.id != product.id).toList());
  }

  bool isFavorite(ProductsModel product) {
    return state.any((item) => item.id == product.id);
  }
}