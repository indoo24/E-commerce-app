import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/GetWichlistResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/delete_from_wish_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/failuers.dart';
import '../../../../domain/use_cases/add_to_wish_list_use_case.dart';
import '../../../../domain/use_cases/get_wish_list_use_case.dart';

part 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  GetWishListUseCase getWishListUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;

  WishlistCubit(
      {required this.getWishListUseCase,
      required this.addToWishListUseCase,
      required this.deleteFromWishListUseCase})
      : super(WishlistInitial());

  List<WishListProductEntity> productList = [];

  static WishlistCubit get(context) => BlocProvider.of(context);

  void getWishList() async {
    Either<Failure, GetWishListResponseEntity> result =
        await getWishListUseCase.invoke();
    result.fold((failure) {
      emit(WishlistErrorState(failure: failure));
    }, (response) {
      productList = response.data!;
      emit(WishlistSuccessState(responseEntity: response));
    });
  }

  void deleteFromWishList(String productId) async {
    var result = await deleteFromWishListUseCase.invoke(productId);
    result.fold((failure) {
      emit(DeleteFromWishlistErrorState(failure: failure));
    }, (response) {
      productList.removeWhere((product) => product.id == productId);
      emit(WishlistSuccessState(
          responseEntity: GetWishListResponseEntity(data: productList)));
      emit(DeleteFromWishlistSuccessState(responseEntity: response));
    });
  }
}
