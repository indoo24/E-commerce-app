import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_count_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failuers.dart';
import '../../../domain/use_cases/delete_item_cart_use_case.dart';

part 'cart_view_model_state.dart';

@injectable
class CartViewModelCubit extends Cubit<CartViewModelState> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartViewModelCubit(
      {required this.getCartUseCase,
      required this.deleteItemUseCase,
      required this.updateCountInCartUseCase})
      : super(CartViewModelInitial());

  List<GetProductCartEntity> productList = [];

  static CartViewModelCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    Either<Failure, GetCartResponseEntity> result =
        await getCartUseCase.invoke();
    result.fold((failure) {
      emit(GetCartErrorState(failure: failure));
    }, (responseEntity) {
      productList = responseEntity.data!.products!;
      emit(GetCartSuccessState(responseEntity: responseEntity));
    });
  }

  void deleteItemInCart(String productId) async {
    Either<Failure, GetCartResponseEntity> result =
        await deleteItemUseCase.invoke(productId);
    result.fold((failure) {
      emit(DeleteItemInCartErrorState(failure: failure));
    }, (responseEntity) {
      emit(GetCartSuccessState(responseEntity: responseEntity));
    });
  }

  void updateCountInCart(String productId, int count) async {
    Either<Failure, GetCartResponseEntity> result =
        await updateCountInCartUseCase.invoke(productId, count);
    result.fold((failure) {
      emit(UpdateCountInCartCartErrorState(failure: failure));
    }, (responseEntity) {
      emit(GetCartSuccessState(responseEntity: responseEntity));
    });
  }
}
