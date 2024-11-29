import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/cart_remote_data_source.dart';

import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';

import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
