import 'package:dartz/dartz.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failuers.dart';

abstract class CartRepository {
  Future<Either<Failure, GetCartResponseEntity>> getCart();

  Future<Either<Failure, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failure, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
