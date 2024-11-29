import 'package:dartz/dartz.dart';

import '../../../domain/entities/GetWichlistResponseEntity.dart';
import '../../../domain/failuers.dart';

abstract class WishListRemoteDataSource {
  Future<Either<Failure, GetWishListResponseEntity>> getWishList();

  Future<Either<Failure, String>> addToWishList({required String productId});

  Future<Either<Failure, String>> deleteProductFromWishList(
      {required String productId});
}
