import 'package:dartz/dartz.dart';

import '../entities/GetWichlistResponseEntity.dart';
import '../failuers.dart';

abstract class WishListRepository {
  Future<Either<Failure, GetWishListResponseEntity>> getWishList();

  Future<Either<Failure, String>> addProductToWishList(String productId);

  Future<Either<Failure, String>> deleteProductFromWishList(String productId);
}
