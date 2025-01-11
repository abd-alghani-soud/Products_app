part of 'update_products_cubit.dart';

@immutable
sealed class UpdateProductsState {}

final class UpdateProductsInitial extends UpdateProductsState {}

class UpdateProductsLoadingState extends UpdateProductsState {}

class UpdateProductsLoadedState extends UpdateProductsState {
  final String? title, price, image, description;

  UpdateProductsLoadedState(this.title, this.price, this.image, this.description);
}
class UpdateProductsSuccessState extends UpdateProductsState {}

class UpdateProductsFailureState extends UpdateProductsState {
  final String error;

  UpdateProductsFailureState(this.error);
}