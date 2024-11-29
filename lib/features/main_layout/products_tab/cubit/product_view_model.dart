import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_product_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_count_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../domain/entities/GetCartResponseEntity.dart';
import '../../../../domain/failuers.dart';

part 'product_state.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  AddToWishListUseCase addToWishListUseCase;

  ProductViewModel(this.getAllProductUseCase, this.addToCartUseCase,
      this.updateCountInCartUseCase, this.addToWishListUseCase)
      : super(ProductInitialState());

  List<ProductEntity> productList = [];
  List<GetProductCartEntity> cartList = [];
  int numOfCartItems = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  Future<void> getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((faliure) => emit(ProductErrorState(faliure)), (response) {
      productList = response.data ?? [];
      emit(ProductSuccessState(response));
    });
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((faliure) => emit(AddToCartErrorState(faliure)), (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(response));
    });
  }

  Future<void> updateCountInCart(String productId, int count) async {
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold(
        (faliure) => emit(UpdateCountInCartCartErrorState(failure: faliure)),
        (responseEntity) {
      emit(UpdateCountInCartSuccessState(responseEntity: responseEntity));
    });
  }

  addToWishList(String productId) async {
    try {
      emit(AddToWishlistLoadingState());
      print('Adding to wishlist, productId: $productId');
      var either = await addToWishListUseCase.invoke(productId);
      either.fold((failure) {
        emit(AddToWishlistErrorState(failure: failure));
        print('Error in addToWishlist: ${failure.errorMessage}');
      }, (response) {
        print('Success response');

        emit(AddToWishlistSuccessState(responseEntity: response));
      });
    } catch (e) {
      print('Exception in addToWishList: $e');
      emit(AddToWishlistErrorState(
          failure: Failure(errorMessage: e.toString())));
    }
  }
}
