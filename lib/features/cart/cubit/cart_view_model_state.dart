part of 'cart_view_model_cubit.dart';

abstract class CartViewModelState {}

class CartViewModelInitial extends CartViewModelState {}

class GetCartLoadingState extends CartViewModelState {}

class GetCartErrorState extends CartViewModelState {
  Failure failure;

  GetCartErrorState({required this.failure});
}

class GetCartSuccessState extends CartViewModelState {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemInCartLoadingState extends CartViewModelState {}

class DeleteItemInCartErrorState extends CartViewModelState {
  Failure failure;

  DeleteItemInCartErrorState({required this.failure});
}

class UpdateCountInCartLoadingState extends CartViewModelState {}

class UpdateCountInCartCartErrorState extends CartViewModelState {
  Failure failure;

  UpdateCountInCartCartErrorState({required this.failure});
}
