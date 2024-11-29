import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/wish_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetWichlistResponseEntity.dart';
import '../failuers.dart';

@injectable
class DeleteFromWishListUseCase {
  WishListRepository wishListRepository;

  DeleteFromWishListUseCase(this.wishListRepository);

  Future<Either<Failure, String>> invoke(String productId) async {
    return wishListRepository.deleteProductFromWishList(productId);
  }
}
