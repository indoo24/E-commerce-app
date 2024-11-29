part of 'product_view_model.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final Failure failure;

  ProductErrorState(this.failure);
}

class ProductSuccessState extends ProductState {
  final ProductResponseEntity productResponseEntity;

  ProductSuccessState(this.productResponseEntity);
}

class AddToCartLoadingState extends ProductState {}

class AddToCartErrorState extends ProductState {
  final Failure failure;

  AddToCartErrorState(this.failure);
}

class AddToCartSuccessState extends ProductState {
  final AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState(this.addToCartResponseEntity);
}

class UpdateCountInCartCartLoadingState extends ProductState {}

class UpdateCountInCartCartErrorState extends ProductState {
  final Failure failure;

  UpdateCountInCartCartErrorState({required this.failure});
}

class UpdateCountInCartSuccessState extends ProductState {
  final GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}

class AddToWishlistLoadingState extends ProductState {}

final class AddToWishlistErrorState extends ProductState {
  final Failure failure;

  AddToWishlistErrorState({required this.failure});
}

final class AddToWishlistSuccessState extends ProductState {
  final String responseEntity;

  AddToWishlistSuccessState({required this.responseEntity});
}
