import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/wish_list_remote_data_source.dart';

import 'package:ecommerce_app/domain/entities/GetWichlistResponseEntity.dart';

import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/wish_list_repository.dart';

@Injectable(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository {
  WishListRemoteDataSource wishListRemoteDataSource;

  WishListRepositoryImpl({required this.wishListRemoteDataSource});

  @override
  Future<Either<Failure, GetWishListResponseEntity>> getWishList() async {
    var either = await wishListRemoteDataSource.getWishList();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, String>> addProductToWishList(String productId) async {
    var either =
        await wishListRemoteDataSource.addToWishList(productId: productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, String>> deleteProductFromWishList(
      String productId) async {
    var either = await wishListRemoteDataSource.deleteProductFromWishList(
        productId: productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
