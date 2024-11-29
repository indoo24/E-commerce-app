import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';

import '../../../domain/failuers.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, GetCartResponseEntity>> getCart();

  Future<Either<Failure, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failure, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
